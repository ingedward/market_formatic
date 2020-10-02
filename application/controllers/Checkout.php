<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Checkout extends MY_Controller
{
    private $orderId;

    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin/Orders_model');
        #--- Adicionado Edward para Formatic
        $this->load->library('paypal_lib');
        $this->load->model('Emails_model','emails',TRUE);
        $this->load->model('Activar_model','activar',TRUE);
        #--- pruebas 20200928 sendinblue
        $this->load->model('Emails_send_model','emailss',TRUE);

    }

    public function index()
    {
        $data = array();
        $head = array();
        $arrSeo = $this->Public_model->getSeo('checkout');
        $head['title'] = @$arrSeo['title'];
        $head['description'] = @$arrSeo['description'];
        $head['keywords'] = str_replace(" ", ",", $head['title']);
        if (isset($_POST['payment_type'])) 
        {
            $errors = $this->userInfoValidate($_POST);
            if (!empty($errors)) 
            {
                $this->session->set_flashdata('submit_error', $errors);
            } 
            else 
            {
                $_POST['referrer'] = $this->session->userdata('referrer');
                $_POST['clean_referrer'] = cleanReferral($_POST['referrer']);
                $_POST['user_id'] = isset($_SESSION['logged_user']) ? $_SESSION['logged_user'] : 0;
                $orderId = $this->Public_model->setOrder($_POST);
                if ($orderId != false) 
                {
                    /*
                     * Save product orders in vendors profiles
                     */
                    $this->setVendorOrders();
                    $this->orderId = $orderId;
                    $this->setActivationLink();
                    $this->sendNotifications();
                    $this->goToDestination();
                } 
                else 
                {
                    log_message('error', 'Cant save order!! ' . implode('::', $_POST));
                    $this->session->set_flashdata('order_error', true);
                    redirect(LANG_URL . '/checkout/order-error');
                }
            }
        }
        $data['bank_account'] = $this->Orders_model->getBankAccountSettings();
        $data['cashondelivery_visibility'] = $this->Home_admin_model->getValueStore('cashondelivery_visibility');
        $data['paypal_email'] = $this->Home_admin_model->getValueStore('paypal_email');
        $data['bestSellers'] = $this->Public_model->getbestSellers();
        $this->render('checkout', $head, $data);
    }

    private function setVendorOrders()
    {
        $this->Public_model->setVendorOrder($_POST);
    }

    /*
     * Send notifications to users that have nofify=1 in /admin/adminusers
     */

    private function sendNotifications()
    {
        $users = $this->Public_model->getNotifyUsers();
        $myDomain = $this->config->item('base_url');
        if (!empty($users)) 
        {
            foreach ($users as $user) 
            {
                $this->sendmail->sendTo($user, 'Admin', 'Nuevo pedido en ' . $myDomain, 'Hola, tienes un nuevo pedido. Puedes verlo en /admin/pedidos');
            }
        }
    }

    private function setActivationLink()
    {
        if ($this->config->item('send_confirm_link') === true) 
        {
            $link = md5($this->orderId . time());
            $result = $this->Public_model->setActivationLink($link, $this->orderId);
            if ($result == true) 
            {
                $url = parse_url(base_url());
                $msg = lang('please_confirm') . base_url('confirm/' . $link);
                $this->sendmail->sendTo($_POST['email'], $_POST['first_name'] . ' ' . $_POST['last_name'], lang('confirm_order_subj') . $url['host'], $msg);
            }
        }
    }


    private function goToDestination()
    {
        if ($_POST['payment_type'] == 'cashOnDelivery' || $_POST['payment_type'] == 'Bank') 
        {
            $this->shoppingcart->clearShoppingCart();
            $this->session->set_flashdata('success_order', true);
        }
        if ($_POST['payment_type'] == 'Bank') 
        {
            $_SESSION['order_id'] = $this->orderId;
            $_SESSION['final_amount'] = $_POST['final_amount'] . $_POST['amount_currency'];
            redirect(LANG_URL . '/checkout/successbank');
        }
        if ($_POST['payment_type'] == 'cashOnDelivery') 
        {
            redirect(LANG_URL . '/checkout/successcash');
        }
        if ($_POST['payment_type'] == 'PayPal') 
        {
            @set_cookie('paypal', $this->orderId, 2678400);

#--- modificado edward            
            //$_SESSION['discountAmount'] = $_POST['discountAmount'];


            $_SESSION['discountAmount'] = 0;

            redirect(LANG_URL . '/checkout/paypalpayment');
        }
        #--- Adicionado Edward
        if ($_POST['payment_type'] == 'Payu') 
        {
            #--- Adicionado Edward
            $this->shoppingcart->clearShoppingCart();
             $_SESSION['order_id']       = $this->orderId;
            $_SESSION['currency']       = $_POST['amount_currency'];
            $_SESSION['final_amount']   = $this->tofloat($_POST['final_amount']);
            $_SESSION['email_buyer']    = $_POST['email'];
            $_SESSION['first_name']     = $_POST['first_name'];
            $_SESSION['last_name']      = $_POST['last_name'];
            redirect(LANG_URL . '/checkout/payupayment');
        }
        #--- Adicionado Edward 20200928
        if ($_POST['payment_type'] == 'ePayco') 
        {
            $this->shoppingcart->clearShoppingCart();
            $_SESSION['order_id']       = $this->orderId;
            $_SESSION['currency']       = $_POST['amount_currency'];
            $_SESSION['final_amount']   = $this->tofloat($_POST['final_amount']);
            $_SESSION['email_buyer']    = $_POST['email'];
            $_SESSION['first_name']     = $_POST['first_name'];
            $_SESSION['last_name']      = $_POST['last_name'];
            redirect(LANG_URL . '/checkout/epaycopayment');
        }

        #--- Adicionado Edward para pruebas
        if ($_POST['payment_type'] == 'PayuTest') 
        {
            #--- Adicionado Edward para pruebas 20200902
            $this->shoppingcart->clearShoppingCart();
             $_SESSION['order_id']       = $this->orderId;
            $_SESSION['currency']       = $_POST['amount_currency'];
            $_SESSION['final_amount']   = $this->tofloat($_POST['final_amount']);
            $_SESSION['email_buyer']    = $_POST['email'];
            $_SESSION['first_name']     = $_POST['first_name'];
            $_SESSION['last_name']      = $_POST['last_name'];
            redirect(LANG_URL . '/checkout/payupaymenttest');
        }

    }
    #--- valida los datos del formulario del pedido
    private function userInfoValidate($post)
    {

        $errors = array();
        if (mb_strlen(trim($post['document'])) == 0) 
        {
            $errors[] = 'No has ingresado el documento';
        }
        if (mb_strlen(trim($post['first_name'])) == 0) 
        {
            $errors[] = lang('first_name_empty');
        }
        if (mb_strlen(trim($post['last_name'])) == 0) 
        {
            $errors[] = lang('last_name_empty');
        }
        if (!filter_var($post['email'], FILTER_VALIDATE_EMAIL)) 
        {
            $errors[] = lang('invalid_email');
        }
        $post['phone'] = preg_replace("/[^0-9]/", '', $post['phone']);
        if (mb_strlen(trim($post['phone'])) == 0) 
        {
            $errors[] = lang('invalid_phone');
        }
        if (mb_strlen(trim($post['address'])) == 0) 
        {
            $errors[] = lang('address_empty');
        }
        if (mb_strlen(trim($post['city'])) == 0) 
        {
            $errors[] = lang('invalid_city');
        }
        #--- Adicionado Edward validacion cursos con descuento
        $quantities = ($post['quantity']);
        $prices     = ($post['price']);
        $countLess  = 0;
        $countGreat = 0;
        for ($i=0; $i < count($prices); $i++) 
        {
            if ($prices[$i] <= 60)
            {
                $countLess++;
            }
            else
            {
                $countGreat++;
            }
        }
        #--- valida que vaya al menos un curso full precio
        if ($countLess >= 1 && $countGreat == 0) 
        {
            $errors[] = 'Debes llevar mínimo un curso completo para el descuento' . $countGreat;
        }
        #--- Adicionado Edward validacion solo 2 cursos con descuento
/*
        $count = 0;
        for ($i=0; $i < count($prices); $i++) 
        {
            if ($prices[$i] <= 60)
            {
                $count = $count + $quantities[$i] ;
            }
        }
        if ($count > 2) 
        {
            $errors[] = 'Sólo puedes llevar 2 cursos con descuento del 50% ' . $count;
        }
*/
        #--- Adicionado Edward validacion solo 1 cursos con descuento de 100%
        $count = 0;
        for ($i=0; $i < count($prices); $i++) 
        {
            if ($prices[$i] <= 10)
            {
                $count = $count + $quantities[$i] ;
            }
        }
        if ($count > 1) 
        {
            $errors[] = 'Sólo puedes llevar 1 curso con descuento del 100% ';
        }
        return $errors;
    }

    public function orderError()
    {
        if ($this->session->flashdata('order_error')) 
        {
            $data = array();
            $head = array();
            $arrSeo = $this->Public_model->getSeo('checkout');
            $head['title'] = @$arrSeo['title'];
            $head['description'] = @$arrSeo['description'];
            $head['keywords'] = str_replace(" ", ",", $head['title']);
            $this->render('checkout_parts/order_error', $head, $data);
        } 
        else 
        {
            redirect(LANG_URL . '/checkout');
        }
    }

    public function paypalPaymentORI()
    {
        $data = array();
        $head = array();
        $arrSeo = $this->Public_model->getSeo('checkout');
        $head['title'] = @$arrSeo['title'];
        $head['description'] = @$arrSeo['description'];
        $head['keywords'] = str_replace(" ", ",", $head['title']);
        $data['paypal_sandbox'] = $this->Home_admin_model->getValueStore('paypal_sandbox');
        $data['paypal_email'] = $this->Home_admin_model->getValueStore('paypal_email');
        $this->render('checkout_parts/paypal_payment', $head, $data);
    }
    #--- Adicionado Edward
    public function paypalPayment()
    {
        $final_amount   = $this->tofloat($_SESSION['final_amount']);
        $payu_amount    = $final_amount / 3700;

        // Set variables for paypal form
        $returnURL = base_url().'paypal/success'; //payment success url
        $cancelURL = base_url().'paypal/cancel'; //payment cancel url
        $notifyURL = base_url().'paypal/ipn'; //ipn url
        $userID = 1; 
        // Add fields to paypal form
        $this->paypal_lib->add_field('return', $returnURL);
        $this->paypal_lib->add_field('cancel_return', $cancelURL);
        $this->paypal_lib->add_field('notify_url', $notifyURL);
        $this->paypal_lib->add_field('item_name', 'Compra Formatic');
        $this->paypal_lib->add_field('custom', $userID);
        $this->paypal_lib->add_field('item_number',  1);
        $this->paypal_lib->add_field('amount',  $payu_amount);
        // Render paypal form
        $this->paypal_lib->paypal_auto_form();
    }

    #--- Adicionado Edward
    public function payuPayment()
    {
        $data = array();
        $head = array();
        $arrSeo = $this->Public_model->getSeo('checkout');
        $head['title'] = @$arrSeo['title'];
        $head['description'] = @$arrSeo['description'];
        $head['keywords'] = str_replace(" ", ",", $head['title']);
        $this->render('checkout_parts/payu_form', $head, $data);
    }

    #--- Adicionado Edward 20200928
    public function epaycoPayment()
    {
        $data = array();
        $head = array();
        $arrSeo = $this->Public_model->getSeo('checkout');
        $head['title'] = @$arrSeo['title'];
        $head['description'] = @$arrSeo['description'];
        $head['keywords'] = str_replace(" ", ",", $head['title']);
        $this->render('checkout_parts/epayco_form', $head, $data);
    }

    #--- Adicionado Edward para pruebas 20200902
    public function payuPaymentTest()
    {
        $data = array();
        $head = array();
        $arrSeo = $this->Public_model->getSeo('checkout');
        $head['title'] = @$arrSeo['title'];
        $head['description'] = @$arrSeo['description'];
        $head['keywords'] = str_replace(" ", ",", $head['title']);
        $this->render('checkout_parts/payu_form_test', $head, $data);
    }

    public function successPaymentCashOnD()
    {
        if ($this->session->flashdata('success_order')) 
        {
            $data = array();
            $head = array();
            $arrSeo = $this->Public_model->getSeo('checkout');
            $head['title'] = @$arrSeo['title'];
            $head['description'] = @$arrSeo['description'];
            $head['keywords'] = str_replace(" ", ",", $head['title']);
            $this->render('checkout_parts/payment_success_cash', $head, $data);
        } 
        else 
        {
            redirect(LANG_URL . '/checkout');
        }
    }

    public function successPaymentBank()
    {
        if ($this->session->flashdata('success_order')) {
            $data = array();
            $head = array();
            $arrSeo = $this->Public_model->getSeo('checkout');
            $head['title'] = @$arrSeo['title'];
            $head['description'] = @$arrSeo['description'];
            $head['keywords'] = str_replace(" ", ",", $head['title']);
            $data['bank_account'] = $this->Orders_model->getBankAccountSettings();
            $this->render('checkout_parts/payment_success_bank', $head, $data);
        } else {
            redirect(LANG_URL . '/checkout');
        }
    }

    public function paypal_cancel()
    {
        if (get_cookie('paypal') == null) {
            redirect(base_url());
        }
        @delete_cookie('paypal');
        $orderId = get_cookie('paypal');
        $this->Public_model->changePaypalOrderStatus($orderId, 'canceled');
        $data = array();
        $head = array();
        $head['title'] = '';
        $head['description'] = '';
        $head['keywords'] = '';
        $this->render('checkout_parts/paypal_cancel', $head, $data);
    }

    public function paypal_success()
    {
        if (get_cookie('paypal') == null) {
            redirect(base_url());
        }
        @delete_cookie('paypal');
        $this->shoppingcart->clearShoppingCart();
        $orderId = get_cookie('paypal');
        $this->Public_model->changePaypalOrderStatus($orderId, 'payed');
        $data = array();
        $head = array();
        $head['title'] = '';
        $head['description'] = '';
        $head['keywords'] = '';
        $this->render('checkout_parts/paypal_success', $head, $data);
    }

        #--- Metodo cuando el usuario se devuelve a la pagina del comercio (formatic)
    public function payuResponse()
    {
        $this->session->userdata['transaction']['payu'] = $this->input->get();
        $state          =   $this->session->userdata['transaction']['payu']['transactionState'];
        $pol            =   $this->session->userdata['transaction']['payu']['polResponseCode'];
        $email          =   $this->session->userdata['transaction']['payu']['buyerEmail'];
        $description    =   $this->session->userdata['transaction']['payu']['description'];
        $orderId        =   $this->session->userdata['transaction']['payu']['referenceCode'];
        #--- transaccion rechazada
        if ($state == 5 or $state == 104) 
        {
            $this->load->view('templates/formatic1/checkout_parts/error');
        } 
        #--- transaccion declinada
        elseif ($state == 6) 
        {
            $this->load->view('templates/formatic1/checkout_parts/declined');
        }
        #--- transaccion aprobada
        elseif ($state == 4 and $pol == 1) 
        {
            $this->load->view('templates/formatic1/checkout_parts/successpayu');
        }
        #--- transaccion pendiente
        elseif ($state == 7) 
        {
            $id_company     = 14;
            $company        = "Venta Digital";
            $obsequios      = "";
            $cursos         = array();
            $cursosPed      = array();
            $pines          = array();
            $nombreCursos   = array();
            $cantidadCursos = array();  #--- Adicionado Edward 20200915
            $cursosRegalo   = array();  #--- Adicionado Edward 20200915
            $pinesRegalo    = array();  #--- Adicionado Edward 20200915 
            $cursosCom      = array();  #--- Adicionado Edward 20200915 
            $order              = $this->Orders_model->getOrder($orderId);
#---temporal edward pruebas envio correo 
            foreach ($order as $tr) 
            {
                $nombre         = trim($tr['first_name']);
                $apellido       = trim($tr['last_name']);
                $correo         = trim($tr['email']);
                $arr_products   = unserialize($tr['products']);
            }

            foreach ($arr_products as $key=>$product) 
            {
                if ($product['product_info']['shop_categorie'] == 3) 
                {
                    $cursosPed[$key]        = $product['product_info']['course_id'];
                    $nombreCursos[$key]     = $product['product_info']['url'];
                    $cantidadCursos[$key]   = $product['product_quantity'];
                }
            }
            $cursos = array_values(array_unique($cursosPed));
            if (!empty($cursos))
            {
                for ($i=0; $i <count($cursos) ; $i++) 
                {
                    $pines[$i]  = $this->activar->getPin($cursos[$i],$id_company)->code;
                }
//                $envio_correo = $this->emails->active_student($cursos, $pines, $correo, $company, $nombre, $apellido, $nombreCursos);

                $envio_correo = $this->emailss->active_student($cursos, $pines, $correo, $company, $nombre, $apellido, $nombreCursos);

                //$envio_correo = $this->emails->test_email($email, $state, $orderId);
                if ($envio_correo) 
                {
                    for ($k=0; $k < count($cursos) ; $k++) 
                    {
                        #--- si se envian los correos marca la tabla pin en el send_mail 
                        $resultado=$this->activar->updatePin($pines[$k],$id_company,$cursos[$k]);
                    }
                }
            }
            #--- adicionado Edward 20200915 cursos repetidos
            for ($i=0; $i <count($cursosPed); $i++) 
            {
                $cursosCom[$i]["curso" ]    =  $cursosPed[$i];
                $cursosCom[$i]["cantidad"]  =  $cantidadCursos[$i];
                $cursosCom[$i]["nombre"]    =  $nombreCursos[$i];

            }
            sort($cursosCom);
            $k = 0;
            for ($i=0; $i < count($cursosCom); $i++) 
            {
                if ($cursosCom[$i]["cantidad"] > 1) 
                {
                    for($j=1; $j<= ($cursosCom[$i]["cantidad"] - 1) ; $j++ )
                    {
                        $cursosRegalo[$k]["curso" ]     =   $cursosCom[$i]["curso"];
                        $cursosRegalo[$k]["nombre" ]    =   $cursosCom[$i]["nombre"];
                        $k++;
                    }
                }
                if($cursosCom[$i]["curso"] == $cursosCom[$i+1]["curso"])
                {
                    $cursosRegalo[$k]["curso" ]     =   $cursosCom[$i]["curso"];
                    $cursosRegalo[$k]["nombre" ]    =   $cursosCom[$i]["nombre"];
                    $k++;
                }
            }

            if (!empty($cursosRegalo))
            {
                $nombre     = '';
                $apellido   = '';
                for ($i=0; $i <count($cursosRegalo) ; $i++) 
                {
                    $cursoRegalo    = $cursosRegalo[$i]["curso"];
                    $nombreRegalo   = $cursosRegalo[$i]["nombre"];
                    $pinRegalo      = $this->activar->getPin($cursoRegalo,$id_company)->code;
                    $envio_correo   = $this->emails->active_gift($cursoRegalo, $pinRegalo, $correo, $company, $nombre, $apellido, $nombreRegalo);
                    if ($envio_correo) 
                    {
                        $resultado=$this->activar->updatePin($pinRegalo,$id_company,$cursoRegalo);
                    }
                }
            }
            echo '<pre>';
            $vars = get_defined_vars();  
            print_r($vars);
            echo '</pre>';
            exit();
//            $this->load->view('templates/formatic1/checkout_parts/pending');
        }
    }

    public function payuConfirmation()
    {
        $payuInfo   = $this->input->post();
/*
        $data['transaction_bank_id']    = $payuInfo['transaction_bank_id'];
        $data['value']                  = $payuInfo['value'];
        $data['currency']               = $payuInfo['currency'];
        $data['description']            = $payuInfo['description'];
        $data['payment_method_type']    = $payuInfo['payment_method_type'];
        $data['installments_number']    = $payuInfo['installments_number'];
        $data['transaction_date']       = $payuInfo['transaction_date'];
        $data['cus']                    = $payuInfo['cus'];
        $data['pse_bank']               = $payuInfo['pse_bank'];
        $data['billing_address']        = $payuInfo['billing_address'];
        $data['phone']                  = $payuInfo['phone'];
        $data['office_phone']           = $payuInfo['office_phone'];
        $data['attempts']               = $payuInfo['attempts'];
        $data['bank_id']                = $payuInfo['bank_id'];
        $data['billing_city']           = $payuInfo['billing_city'];
        $data['billing_country']        = $payuInfo['billing_country'];
        $data['date']                   = $payuInfo['date'];
        $data['ip']                     = $payuInfo['ip'];
        $data['nickname_buyer']         = $payuInfo['nickname_buyer'];
        $data['nickname_seller']        = $payuInfo['nickname_seller'];
        $data['url_origen']             = $payuInfo['url_origen'];
*/
        $data['state_pol']          = $payuInfo['state_pol'];
        if(isset($payuInfo['response_code_pol']))
        {
            $data['response_code_pol']   = $payuInfo['response_code_pol'];
        }
        else
        {
            $data['response_code_pol']   = "";
        }

        if(isset($payuInfo['payment_method_name']))
        {
            $data['payu_method_name']   = $payuInfo['payment_method_name'];
        }
        else
        {
            $data['payu_method_name']   = "";
        }
        if (isset($payuInfo["reference_pol"])) 
        {
            $data['txn_id'] = $payuInfo["reference_pol"];
        }
        else
        {
            $data['txn_id'] = "";   
        }
        if (isset($payuInfo["email_buyer"])) 
        {
            $data['payer_email']    = $payuInfo["email_buyer"];
        }
        else
        {
            $data['payer_email'] = "";   
        }
        if (isset($payuInfo['reference_sale'])) 
        {
            $data['reference_sale']    = $payuInfo['reference_sale'];
        }
        else
        {
            $data['reference_sale'] = "";   
        }
        $txn_id             = $payuInfo["reference_pol"];
        $payer_email        = $data['payer_email'];
        $state_payu         = $data['state_pol'];
        $payu_method_name   = $data['payu_method_name'];      
        $orderId            = $data['reference_sale'];      
        $response_code_pol  = $data['response_code_pol']; 
        $this->Public_model->changePayuOrderStatus($orderId, $response_code_pol, $payu_method_name);
        //$envio_correo = $this->emails->test_email($txn_id, $payer_email, $state_payu, $payu_method_name, $orderId, $response_code_pol);
        if ($response_code_pol == 1) 
        {
            $id_company     = 14;
            $company        = "Venta Digital";
            $obsequios      = "";
            $cursos         = array();
            $cursosPed      = array();
            $pines          = array();
            $nombreCursos   = array();
            $cantidadCursos = array();  #--- Adicionado Edward 20200915
            $cursosRegalo   = array();  #--- Adicionado Edward 20200915
            $pinesRegalo    = array();  #--- Adicionado Edward 20200915 
            $cursosCom      = array();  #--- Adicionado Edward 20200915 
            $order          = $this->Orders_model->getOrder($orderId);
            foreach ($order as $tr) 
            {
                $nombre         = trim($tr['first_name']);
                $apellido       = trim($tr['last_name']);
                $correo         = trim($tr['email']);
                $arr_products   = unserialize($tr['products']);
            }
            foreach ($arr_products as $key=>$product) 
            {
                if ($product['product_info']['shop_categorie'] == 3) 
                {
                    $cursosPed[$key]        = $product['product_info']['course_id'];
                    $nombreCursos[$key]     = $product['product_info']['url'];
                    $cantidadCursos[$key]   = $product['product_quantity'];
                }
            }
            $cursos = array_values(array_unique($cursosPed));
            if (!empty($cursos))
            {
                for ($i=0; $i <count($cursos) ; $i++) 
                {
                    $pines[$i]  = $this->activar->getPin($cursos[$i],$id_company)->code;
                }
                $envio_correo = $this->emails->active_student($cursos, $pines, $correo, $company, $nombre, $apellido, $nombreCursos);
                //$envio_correo = $this->emails->test_email($email, $state, $orderId);
                if ($envio_correo) 
                {
                    for ($k=0; $k < count($cursos) ; $k++) 
                    {
                        #--- si se envian los correos marca la tabla pin en el send_mail 
                        $resultado=$this->activar->updatePin($pines[$k],$id_company,$cursos[$k]);
                    }
                }
            }
            #--- adicionado Edward 20200915 cursos repetidos
            for ($i=0; $i <count($cursosPed); $i++) 
            {
                $cursosCom[$i]["curso" ]    =  $cursosPed[$i];
                $cursosCom[$i]["cantidad"]  =  $cantidadCursos[$i];
                $cursosCom[$i]["nombre"]    =  $nombreCursos[$i];

            }
            sort($cursosCom);
            $k = 0;
            for ($i=0; $i < count($cursosCom); $i++) 
            {
                if ($cursosCom[$i]["cantidad"] > 1) 
                {
                    for($j=1; $j<= ($cursosCom[$i]["cantidad"] - 1) ; $j++ )
                    {
                        $cursosRegalo[$k]["curso" ]     =   $cursosCom[$i]["curso"];
                        $cursosRegalo[$k]["nombre" ]    =   $cursosCom[$i]["nombre"];
                        $k++;
                    }
                }
                if($cursosCom[$i]["curso"] == $cursosCom[$i+1]["curso"])
                {
                    $cursosRegalo[$k]["curso" ]     =   $cursosCom[$i]["curso"];
                    $cursosRegalo[$k]["nombre" ]    =   $cursosCom[$i]["nombre"];
                    $k++;
                }
            }

            if (!empty($cursosRegalo))
            {
                $nombre     = '';
                $apellido   = '';
                for ($i=0; $i <count($cursosRegalo) ; $i++) 
                {
                    $cursoRegalo    = $cursosRegalo[$i]["curso"];
                    $nombreRegalo   = $cursosRegalo[$i]["nombre"];
                    $pinRegalo      = $this->activar->getPin($cursoRegalo,$id_company)->code;
                    $envio_correo   = $this->emails->active_gift($cursoRegalo, $pinRegalo, $correo, $company, $nombre, $apellido, $nombreRegalo);
                    if ($envio_correo) 
                    {
                        $resultado=$this->activar->updatePin($pinRegalo,$id_company,$cursoRegalo);
                    }
                }
            }
        }
    }
    #--- funcion adicionada Edward para la conversion del monto
    function tofloat($num) 
    {
        $dotPos = strrpos($num, '.');
        $commaPos = strrpos($num, ',');
        $sep = (($dotPos > $commaPos) && $dotPos) ? $dotPos :
            ((($commaPos > $dotPos) && $commaPos) ? $commaPos : false);
      
        if (!$sep) {
            return floatval(preg_replace("/[^0-9]/", "", $num));
        }

        return floatval(
            preg_replace("/[^0-9]/", "", substr($num, 0, $sep)) . '.' .
            preg_replace("/[^0-9]/", "", substr($num, $sep+1, strlen($num)))
        );
    }

}
