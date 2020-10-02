<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    #--- Variables del formulario
    $ReferenceCode  = $_SESSION['order_id'];
    $Amount         = $_SESSION['final_amount'];
    $buyerFullName  = $_SESSION['first_name'] . " " . $_SESSION['last_name'];
    $buyerEmail     = $_SESSION['email_buyer'];
    #--- cuenta de pruebas
    $AccountId      =   512321;                           // Account de Pruebas
    $ApiKey         =   "4Vj8eK4rloUd272L48hsrarnUA";     // API de Pruebas
    $MerchantId     =   508029;                           // ID de Pruebas
    $Test           =   1;
    $name_course    =   'Compra Formatic';
    $Amount         =   10000;
    //$id_course      =   11;

    #--- cuenta de produccion
/*
    $AccountId      =   628180;                           // Account de Producción
    $ApiKey         =   "0ScOD9M4VJsEylzUFXpET9PIRR";     // API de Produccion
    $MerchantId     =   625804;                           // ID de Produccion
    $Test           =   0;
    $name_course    =   'Compra Formatic';
*/
//    $Amount         =   $price;

    $Currency       =   "COP";
    //$ReferenceCode  =   $id_course ."-" .strftime("%Y%m%d%H%M%S") ."-" .rand(rand(5, 15), rand(500, 1500));
    $Signature      =   md5($ApiKey ."~" .$MerchantId ."~" .$ReferenceCode ."~" .$Amount ."~" .$Currency);
    $Description    =   $name_course;
//    $name           =   $publicaciones['name'];
/*
    $buyerEmail     = $this->session->userdata['buyerEmail'];
    $amount         = $this->session->userdata['amount'];
    $buyerFullName  = $this->session->userdata['buyerFullName'];
    $referenceCode  = $this->session->userdata['referenceCode'];
*/

?>
<body onload="submit()">
<form>
    <script
        src="https://checkout.epayco.co/checkout.js"
        class="epayco-button"
        id="btnenviar"
        data-epayco-key="491d6a0b6e992cf924edd8d3d088aff1"
        data-epayco-amount="50000"
        data-epayco-name="Curso Formatic"
        data-epayco-description="Curso Formatic"
        data-epayco-currency="cop"
        data-epayco-country="co"
        data-epayco-test="true"
        data-epayco-external="true"
        data-epayco-response="https://ejemplo.com/respuesta.html"
        data-epayco-confirmation="https://ejemplo.com/confirmacion">
    </script>
</form>

<script type="text/javascript">
    function submit()
    {
        document.getElementById("btnenviar").click(); // Simulates button click
    }
</script>