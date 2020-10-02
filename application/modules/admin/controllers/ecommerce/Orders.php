<?php


if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Orders extends ADMIN_Controller
{

    private $num_rows = 10;

    public function __construct()
    {
        parent::__construct();
        $this->load->library('SendMail');
        $this->load->model(array('Orders_model', 'Home_admin_model'));
    }

    public function index($page = 0)
    {
        $this->login_check();
        $data = array();
        $head = array();
        $head['title'] = 'Administration - Orders';
        $head['description'] = '!';
        $head['keywords'] = '';

        $order_by = null;
        if (isset($_GET['order_by'])) {
            $order_by = $_GET['order_by'];
        }
        $rowscount      = $this->Orders_model->ordersCount();
        $data['orders'] = $this->Orders_model->orders($this->num_rows, $page, $order_by);
        $data['links_pagination'] = pagination('admin/orders', $rowscount, $this->num_rows, 3);
        if (isset($_POST['paypal_sandbox'])) {
            $this->Home_admin_model->setValueStore('paypal_sandbox', $_POST['paypal_sandbox']);
            if ($_POST['paypal_sandbox'] == 1) {
                $msg = 'Paypal sandbox mode activated';
            } else {
                $msg = 'Paypal sandbox mode disabled';
            }
            $this->session->set_flashdata('paypal_sandbox', $msg);
            $this->saveHistory($msg);
            redirect('admin/orders?settings');
        }
        if (isset($_POST['paypal_email'])) {
            $this->Home_admin_model->setValueStore('paypal_email', $_POST['paypal_email']);
            $this->session->set_flashdata('paypal_email', 'Public quantity visibility changed');
            $this->saveHistory('Change paypal business email to: ' . $_POST['paypal_email']);
            redirect('admin/orders?settings');
        }
        if (isset($_POST['cashondelivery_visibility'])) {
            $this->Home_admin_model->setValueStore('cashondelivery_visibility', $_POST['cashondelivery_visibility']);
            $this->session->set_flashdata('cashondelivery_visibility', 'Cash On Delivery Visibility Changed');
            $this->saveHistory('Change Cash On Delivery Visibility - ' . $_POST['cashondelivery_visibility']);
            redirect('admin/orders?settings');
        }
        if (isset($_POST['iban'])) {
            $this->Orders_model->setBankAccountSettings($_POST);
            $this->session->set_flashdata('bank_account', 'Bank account settings saved');
            $this->saveHistory('Bank account settings saved for : ' . $_POST['name']);
            redirect('admin/orders?settings');
        }
        $data['paypal_sandbox'] = $this->Home_admin_model->getValueStore('paypal_sandbox');
        $data['paypal_email'] = $this->Home_admin_model->getValueStore('paypal_email'); 
        $data['cashondelivery_visibility'] = $this->Home_admin_model->getValueStore('cashondelivery_visibility');
        $data['bank_account'] = $this->Orders_model->getBankAccountSettings();
        $this->load->view('_parts/header', $head);
        $this->load->view('ecommerce/orders', $data);
        $this->load->view('_parts/footer');
        if ($page == 0) {
            $this->saveHistory('Go to orders page');
        }
    }

    public function changeOrdersOrderStatus()
    {
        $this->login_check();

        $result = false;
        $sendedVirtualProducts = true;
        $virtualProducts = $this->Home_admin_model->getValueStore('virtualProducts');
        /*
         * If we want to use Virtual Products
         * Lets send email with download links to user email
         * In error logs will be saved if cant send email from PhpMailer
         */
        if ($virtualProducts == 1) {
            if ($_POST['to_status'] == 1) {
                $sendedVirtualProducts = $this->sendVirtualProducts();
            }
        }

        if ($sendedVirtualProducts == true) {
            $result = $this->Orders_model->changeOrderStatus($_POST['the_id'], $_POST['to_status']);
        }

        if ($result == true && $sendedVirtualProducts == true) {
            echo 1;
        } else {
            echo 0;
        }
        $this->saveHistory('Change status of Order Id ' . $_POST['the_id'] . ' to status ' . $_POST['to_status']);
    }

    private function sendVirtualProducts()
    {
        if(isset($_POST['products']) && $_POST['products'] != '') {
            $products = unserialize(html_entity_decode($_POST['products']));
            foreach ($products as $product_id => $product_quantity) {
                $productInfo = modules::run('admin/ecommerce/products/getProductInfo', $product_id);
                /*
                 * If is virtual product, lets send email to user
                 */
                if ($productInfo['virtual_products'] != null) {
                    if (!filter_var($_POST['userEmail'], FILTER_VALIDATE_EMAIL)) {
                        log_message('error', 'Ivalid customer email address! Cant send him virtual products!');
                        return false;
                    }
                    $result = $this->sendmail->sendTo($_POST['userEmail'], 'Dear Customer', 'Virtual products', $productInfo['virtual_products']);
                    return $result;
                }
            }
            return true;
        }
    }
    #--- Adicionado Edward 20200901
    public function download() 
    {
        $page           = 0;
        $order_by       = null;
        $rowscount      = $this->Orders_model->ordersCount();
        $data['orders'] = $this->Orders_model->orders($rowscount, $page, $order_by);

        set_time_limit(3600);
        $this->load->library('Excel');
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);
        $table_columns = array("Pedido ID","Fecha","Documento","Nombre","Email","Teléfono","Ciudad","Dirección","Total");
        $column = 0;
        $estilo = array(
            'font' => array(
                'bold' => true,
                'size' => 12,
                'name' => 'Calibri'
            )
        );
        $object->getActiveSheet()->getStyle('A1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('B1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('C1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('D1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('E1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('F1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('G1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('H1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('I1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('J1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('K1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('L1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('M1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('N1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('O1')->applyFromArray($estilo);
        $object->getActiveSheet()->getStyle('P1')->applyFromArray($estilo);
        foreach ($table_columns as $field) 
        {
            $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
            $column++;
        }
        $excel_row = 2;
        foreach ($data['orders'] as $tr) 
        {
            $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, $tr['order_id']);
            $object->getActiveSheet()->setCellValueByColumnAndRow(1, $excel_row, date('Y-M-d H:i:s',$tr['date']));
            $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, $tr['document_number']);
            $object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, $tr['first_name'] . ' ' . $tr['last_name']);
            $object->getActiveSheet()->setCellValueByColumnAndRow(4, $excel_row, $tr['email']);
            $object->getActiveSheet()->setCellValueByColumnAndRow(5, $excel_row, $tr['phone']);
            $object->getActiveSheet()->setCellValueByColumnAndRow(6, $excel_row, $tr['city']);
            $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $tr['address']);
            $arr_products = unserialize($tr['products']);
            $col = 9;
            $total_amount = 0;
            foreach ($arr_products as $product) 
            {   
                $total_amount += str_replace(' ', '', str_replace(',', '.',$product['product_info']['price']));
                $product = $product['product_info']['url'];
                $object->getActiveSheet()->setCellValueByColumnAndRow($col, 1, 'Curso');
                $object->getActiveSheet()->setCellValueByColumnAndRow($col, $excel_row, $product);
                $col++;
            }
            $object->getActiveSheet()->setCellValueByColumnAndRow(8, $excel_row, $total_amount);
            $excel_row++;
        }
        $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel5');
        header('Content_Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename="pedidos_market.xls"');
        $object_writer->save('php://output');
    }

}
