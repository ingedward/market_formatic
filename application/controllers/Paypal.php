<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Paypal extends CI_Controller{
	
	 function  __construct()
	 {
		parent::__construct();
		
		// Load paypal library & product model
		$this->load->library('paypal_lib');
		$this->load->model('Emails_model','emails',TRUE);
		$this->load->model('Activar_model','activar',TRUE);
	 }
	 
	function success()
	{
		// Get the transaction data
		$paypalInfo 			= $this->input->get();
		$data['item_name']		= $paypalInfo['item_name'];
		$data['item_number']	= $paypalInfo['item_number'];
		$data['txn_id'] 		= $paypalInfo["tx"];
		$data['payment_amt'] 	= $paypalInfo["amt"];
		$data['currency_code'] 	= $paypalInfo["cc"];
		$data['status'] 		= $paypalInfo["st"];
		$txn_id = $paypalInfo["tx"];
		#--- Adicionados Edward
/*
		$data['first_name'] 	= $this->payment->getPayment($txn_id)->first_name;
		$data['last_name'] 		= $this->payment->getPayment($data['txn_id'])->last_name;
		$data['email']			= $this->payment->getPayment($data['txn_id'])->payer_email;
		#--- conpany 14 es venta digital
		$id_company = 14;
		$data['pin'] 			= $this->activar->getPin($paypalInfo['item_number'],$id_company)->code;
		$curso 		= $paypalInfo['item_number'];
		$pin 		= $data['pin'];
		$correo 	= $data['email'];
		$company 	= 'Venta Digital';
		$nombre 	= $data['first_name'];
		$apellido 	= $data['last_name'];
		//$envio_correo = $this->emails->test_email();
		$envio_correo = $this->emails->active_student($curso,$pin,$correo,$company,$nombre,$apellido,$curso);
		if ($envio_correo) 
        {
        	$this->activar->updatePin($data['pin'],$id_company,$data['item_number']);
        }
		#--- Pass the transaction data to view
//		$this->load->view('paypal/success', $data);
        #--- vista igual a Payu
		$data['email']		= $this->payment->getPayment($paypalInfo["tx"])->payer_email;
		$data['company']	= 'Venta digital';
//		$data['pin'] 		= $this->activar->getPin($id_course,$id_company)->code;
		$data['pin'] 		= $this->activar->getPin($paypalInfo['item_number'],$id_company)->code;
        $this->load->view('payments/success',$data);
*/
        $this->load->view('payments/successpayu');

	}
	 
	 function cancel()
	 {
		// Load payment failed view
		$this->load->view('paypal/cancel');
	 }
	 
	 function ipn()
	 {
		// Paypal posts the transaction data
		$paypalInfo = $this->input->post();
		if(!empty($paypalInfo))
		{
			// Validate and get the ipn response
			$ipnCheck = $this->paypal_lib->validate_ipn($paypalInfo);
			// Check whether the transaction is valid
			if($ipnCheck)
			{
				// Insert the transaction data in the database
				$data['user_id']		= $paypalInfo["custom"];
				$data['product_id']		= $paypalInfo["item_number"];
				$data['txn_id']			= $paypalInfo["txn_id"];
				$data['payment_gross']	= $paypalInfo["mc_gross"];
				$data['currency_code']	= $paypalInfo["mc_currency"];
				$data['payer_email']	= $paypalInfo["payer_email"];
				$data['payment_status'] = $paypalInfo["payment_status"];
				#--- Adicionados Edward	
				$data['last_name'] 		= $paypalInfo["last_name"];
				$data['first_name'] 	= $paypalInfo["first_name"];
				$this->product->insertTransaction($data);
				#--- Adicionados Edward	
				$id_company = 14;
				$pin 			= $this->activar->getPin($paypalInfo['item_number'],$id_company)->code;
				$curso 		= $paypalInfo['item_number'];
				$correo 	= $data['payer_email'];
				$company 	= 'Venta Digital';
				$nombre 	= $data['first_name'];
				$apellido 	= $data['last_name'];
				//$envio_correo = $this->emails->test_email();
				$envio_correo = $this->emails->active_student($curso,$pin,$correo,$company,$nombre,$apellido,$curso);
				$this->activar->updatePin($pin,$id_company,$curso);
/*
				if ($envio_correo) 
		        {
		        	$this->activar->updatePin($pin,$id_company,$curso);
		        }
*/
			}
		}
    }
}