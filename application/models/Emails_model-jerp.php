<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
   Class: Emails_model
  
*/
class Emails_model extends CI_Model {
	function __construct()
    {
        parent::__construct();
        $this->load->library('email');
        $this->db = $this->load->database('formatic', TRUE);
    }

    public function test_email($email, $state, $orderId)
    {
		$config = Array(
              'protocol' => 'smtp',
              'smtp_host' => 'mail.exclusivehosting.net',
              'smtp_port' => 25,
              'smtp_user' => 'mail@formatic.academy',
              'smtp_pass' => 'X1mBG25qjc',
              'mailtype' => 'html',
              'crlf' => "\r\n",
              'newline' => "\r\n",
              'wordwrap' => TRUE
        );

    	$mensaje = "<h1>Mensaje de prueba </h1><br>email: " . $email . " <br>state_payu: " . $state . "<br>orderId: " . $orderId;
//    	$emailToSend1 = array("edward.rodriguez@formatic.com.co");
    	$emailToSend1 = array("ing.erodriguez@outlook.com");
//		$this->email->from('info@formatic.com.co','Formatic');
		$this->email->from('mail@formatic.academy','Formatic');

		$this->email->to($emailToSend1);
		$this->email->subject('Mensaje de prueba Market');
		$this->email->message($mensaje);
		$this->email->send();
    }

	public function active_student($cursos, $pines, $correo, $companie, $nombre, $apellido, $nombreCursos)
	{	
#--- CAMBIAR PARA PRODUCCION
/*
			$config = Array(
                  'protocol' => 'smtp',
                  'smtp_host' => 'formatic.com.co',
                  'smtp_port' => 25,
                  'smtp_user' => 'desarrolloback@formatic.com.co',
                  'smtp_pass' => 'DESfor.2073',
                  'mailtype' => 'html',
                  'crlf' => "\r\n",
                  'newline' => "\r\n",
                  'wordwrap' => TRUE
            );
*/
		$config = Array(
              'protocol' 	=> 'smtp',
              'smtp_host' 	=> 'mail.exclusivehosting.net',
              'smtp_port' 	=> 25,
              'smtp_user' 	=> 'mail@formatic.academy',
              'smtp_pass' 	=> 'X1mBG25qjc',
              'mailtype' 	=> 'html',
              'crlf' 		=> "\r\n",
              'newline' 	=> "\r\n",
              'wordwrap' 	=> TRUE
        );
		$numeroPines 	= count($pines);
		$final_link		= "general";
		$bccToSend = array("info@formatic.com.co");
		$emailToSend1 = array("info@formatic.com.co");

/* PRODUCCION */
//		$link="https://formatic.com.co/platform/registro?".http_build_query($pines).'&nP='.$numeroPines.'&correo='.$correo.'&nombre='.$nombre.'&apellido='.$apellido.'&companie='.$companie;

/* PRUEBAS */
		$link="https://formatic.academy/dev-formatic/platform/registro?".http_build_query($pines).'&nP='.$numeroPines.'&correo='.$correo.'&nombre='.$nombre.'&apellido='.$apellido.'&companie='.$companie;
		//Data a enviar 
		$data=	array(
			'apellido'		=>	$apellido,
			'nombre'		=>	$nombre,
			'link'			=>	$link
		);
		$mensaje 	= $this->load->view( 'templates/formatic1/emails/active/'.$final_link, $data, TRUE );
		$correo1 	= true;
		try 
		{
			$emailToSend2 = array($correo);
			$this->email->initialize($config);
			/* PRODUCCION	*/
//			$this->email->from('info@formatic.com.co','Formatic');
			/* PRUEBAS */
			$this->email->from('mail@formatic.academy','Formatic');
			$this->email->to($emailToSend2);
			$this->email->subject('Activa tus cursos '.$nombre.' '.$apellido);
			$this->email->bcc($bccToSend);
			$this->email->message($mensaje);
			$this->email->send();
		} 
		catch(\SendGrid\Exception $e) 
		{
			$err_messa = "Code: " . $e->getCode();
		    foreach($e->getErrors() as $er) 
		    {
		        $err_messa .= ", " . $er;
		    }
		    log_message('debug', "Ocurrió un error enviando el correo electrónico (Activacion usuario) al usuario {$correo}, Error : " . $err_messa);
			$correo1 = false;
		}
		if(!$correo1){
			return FALSE;
		}
		else{
			return TRUE;
		}

		$data2 =	array(
			'pines'			=>	$pines,
			'nombreCursos'	=>	$nombreCursos,
			'apellido'		=>	$apellido,
			'nombre'		=>	$nombre,
			'companie'		=>	$companie,
			'correo'		=>	$correo,
			'pedido'		=>  0,
			'libranza'		=>  0
		);
		$mensaje2 	= $this->load->view( 'templates/formatic1/emails/active/tabla_datos_persona', $data2, TRUE );
//		$mensaje2 	= "correo de envio de los pines";
		try 
		{
//			$this->email->initialize($config);
			/* PRODUCCION */
//			$this->email->from('info@formatic.com.co','Formatic');
			/* PRUEBAS */
			$this->email->from('mail@formatic.academy','Formatic');
			$this->email->to($emailToSend1);
			$this->email->subject('Pines de '.$nombre.' '.$companie);
			$this->email->message($mensaje2);
			$this->email->send();
			$correo2	= true;
		} 
		catch(\SendGrid\Exception $e) 
		{
			$err_messa = "Code: " . $e->getCode();
		    foreach($e->getErrors() as $er) 
		    {
		        $err_messa .= ", " . $er;
		    }
		    log_message('debug', "Ocurrió un error enviando el correo electrónico (copia de pines) al usuario: {$correo}, Error : " . $err_messa);
			$correo2 = false;
		}
	}
	#--- Envío de pines para obsequiar Edward 20200915-01
	public function active_gift($curso, $pin, $correo, $companie, $nombre, $apellido, $nombreCurso)
	{	
	switch ($curso) 
	{
		case 9:
			$final_link	=	"pnlini_sin";
		break;
		case 11:
			$final_link	=	"excel_al_dia_sin";
		break;
		case 16:
			$final_link	=	"project_al_dia_sin";
		break;
		case 17:
			$final_link	=	"access_al_dia_sin";
		break;
		case 18:
			$final_link	=	"word_al_dia_sin";
		break;
		default:
			$final_link	=	"general";
		break;
	}
/* CAMBIAR PARA PRODUCCION */
/*
		$config = Array(
              'protocol' => 'smtp',
              'smtp_host' => 'formatic.com.co',
              'smtp_port' => 25,
              'smtp_user' => 'desarrolloback@formatic.com.co',
              'smtp_pass' => 'DESfor.2073',
              'mailtype' => 'html',
              'crlf' => "\r\n",
              'newline' => "\r\n",
              'wordwrap' => TRUE
        );
*/
/* PRUEBAS */
		$config = Array(
              'protocol' => 'smtp',
              'smtp_host' => 'mail.exclusivehosting.net',
              'smtp_port' => 25,
              'smtp_user' => 'mail@formatic.academy',
              'smtp_pass' => 'X1mBG25qjc',
              'mailtype' => 'html',
              'crlf' => "\r\n",
              'newline' => "\r\n",
              'wordwrap' => TRUE
        );
		$bccToSend = array("info@formatic.com.co");
		$emailToSend1 = array("info@formatic.com.co");
/* CAMBIAR PARA PRODUCCION */
//		$link="https://formatic.com.co/platform/registro/obsequio?0=".$pin.'&nP=1&correo=&nombre='.$nombre.'&apellido='.$apellido.'&companie='.$companie;

/* PRUEBAS */
		$link="https://formatic.academy/dev-formatic/platform/registro/obsequio?0=".$pin.'&nP=1&correo=&nombre='.$nombre.'&apellido='.$apellido.'&companie='.$companie;
//		$final_link		= "general";
		//Data a enviar 
		$data=	array(
			'apellido'		=>	$apellido,
			'nombre'		=>	$nombre,
			'link'			=>	$link
		);
		$mensaje 	= $this->load->view( 'templates/formatic1/emails/active/'.$final_link, $data, TRUE );
		$correo1	= true;
		try 
		{
			$emailToSend2 = array($correo);
//			$emailToSend2 = 'ing.erodriguez@outlook.com';
			$this->load->library('email');
			$this->email->initialize($config);
/* CAMBIAR PARA PRODUCCION */
//			$this->email->from('info@formatic.com.co','Formatic');
			$this->email->from('mail@formatic.academy','Formatic');
			$this->email->to($emailToSend2);
			$this->email->subject('Este es tu curso para obsequiar');
			$this->email->bcc($bccToSend);
			$this->email->message($mensaje);
			$this->email->send();
		} 
		catch(\SendGrid\Exception $e) 
		{
			$err_messa = "Code: " . $e->getCode();
		    foreach($e->getErrors() as $er) 
		    {
		        $err_messa .= ", " . $er;
		    }
		    log_message('debug', "Ocurrió un error enviando el correo electrónico (envío obsequio) al usuario {$correo}, Error : " . $err_messa);
			$correo1	= false;
		}
		if(!$correo1){
			return FALSE;
		}
		else{
			return TRUE;
		}

		$data2=	array(
			'pin'			=>	$pin,
			'nombreCurso'	=>	$nombreCurso,
			'apellido'		=>	$apellido,
			'nombre'		=>	$nombre,
			'companie'		=>	$companie,
			'correo'		=>	$correo,
			'pedido'		=>  0,
			'libranza'		=>  0
		);
		$mensaje2 	= $this->load->view('templates/formatic1/emails/active/tabla_datos_persona', $data2, TRUE );
		//ENVIO CON MADRILL
		$correo2	= true;
		try 
		{
			$this->load->library('email');
			/* PRODUCCION */
//			$this->email->from('info@formatic.com.co','Formatic');
			/* PRUEBAS */
			$this->email->from('mail@formatic.academy','Formatic');
			$this->email->to($emailToSend1);
			$this->email->subject('Pines de '.$nombre.' '.$companie);
			//$this->email->bcc($bccToSend);
			$this->email->message($mensaje2);
			$this->email->send();
		} 
		catch(\SendGrid\Exception $e) 
		{
			$err_messa = "Code: " . $e->getCode();
		    foreach($e->getErrors() as $er) 
		    {
		        $err_messa .= ", " . $er;
		    }
		    log_message('debug', "Ocurrió un error enviando el correo electrónico (copia pin) al usuario {$correo}, Error : " . $err_messa);
			$correo2	= false;
		}
	}

	public function sendOpenLink( $pinesMail=array(), $nombreMail = "", $apellidoMail = '', $correoMail = '', $companie='' )
	{
		switch($companie)
		{
			case 'Universo':
				$emailToSend1 = array("info@formatic.com.co");
				$bccToSend='info@formatic.com.co';
			break;
			case 'Coonalce':
				$emailToSend1 = array("info@formatic.com.co");
				$bccToSend='info@formatic.com.co';
			break;
			case 'Perú':
				$emailToSend1 = array("peru@editorialuniverso.com");
				$bccToSend='peru@editorialuniverso.com';
			break;
			case 'Esic Trade In México':
				$emailToSend1 = array("pines@esic.tradein.com.mx");
				$bccToSend='pines@esic.tradein.com.mx';
			break;
			case 'Santel México':
				$emailToSend1 = array("santelmexico@editorialuniverso.com");
				$bccToSend='santelmexico@editorialuniverso.com';
			break;
			default:
				$bccToSend = array("info@formatic.com.co");
				$emailToSend1 = array("info@formatic.com.co");
			break;
		}
		//Data a enviar 
		$data=array(
			'nombre'		=>	$nombreMail,
			'apellido'		=>	$apellidoMail,
			'correo'		=>	$correoMail,
			'pines'      	=>  $pinesMail
			);
		$mensaje 	=	$this->load->view( 'emails/'.$this->config->item('language').'/linkOpen/linkopen', $data, TRUE );
		//ENVIO CON MADRILL
		try 
		{
			$this->load->library('email');
			$this->email->from('info@formatic.com.co','Formatic');
			$this->email->to($emailToSend1);
			$this->email->subject('Confirmación de apertura de '.$nombreMail.' '.$apellidoMail);
			//$this->email->bcc($bccToSend);
			$this->email->message($mensaje);
			$this->email->send();
		} 
		catch(\SendGrid\Exception $e) 
		{
			$err_messa = "Code: " . $e->getCode();
		    foreach($e->getErrors() as $er) 
		    {
		        $err_messa .= ", " . $er;
		    }
		    log_message('debug', "Ocurrió un error enviando el correo electrónico (Recuperar contraseña) al usuario {$email}, Error : " . $err_messa);
			return FALSE;
		}
		return TRUE;
	}
}