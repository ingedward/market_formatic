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
<body onload="document.forms.payment_payu.submit()">
<!-- PRODUCCION -->
<!--
    <form method="post" action="https://checkout.payulatam.com/ppp-web-gateway-payu/" accept-charset="UTF-8" name="payment_payu">
-->
<!-- PRUEBAS -->
    <form method="post" action="https://sandbox.checkout.payulatam.com/ppp-web-gateway-payu/" accept-charset="UTF-8" name="payment_payu">

        <input name="merchantId"        type="hidden"   value="<?php echo $MerchantId; ?>" />
        <input name="ApiKey"            type="hidden"   value="<?php echo $ApiKey; ?>" />
        <input name="referenceCode"     type="hidden"   value="<?php echo $ReferenceCode; ?>" />
        <input name="accountId"         type="hidden"   value="<?php echo $AccountId; ?>" />
        <input name="description"       type="hidden"   value="<?php echo $Description; ?>" />
        <input name="amount"            type="hidden"   value="<?php echo $Amount; ?>" />

        <input name="buyerFullName"     type="hidden"   value="<?php echo $buyerFullName; ?>" />
        <input name="buyerEmail"        type="hidden"   value="<?php echo $buyerEmail; ?>" />

        <input name="tax"               type="hidden"   value="0" />
        <input name="taxReturnBase"     type="hidden"   value="0" />
        <input name="currency"          type="hidden"   value="COP" />
        <input name="test"              type="hidden"   value="<?php echo $Test; ?>" /> 
        <input name="signature"         type="hidden"   value="<?php echo $Signature; ?>" />
<!-- PRODUCCION -->
        <input name="responseUrl"       type="hidden"  value="https://formatic.com.co/market/payment/payu/response" />
        <!-- <input name="responseUrl"       type="hidden"  value="https://formatic.com.co/market" /> -->

        <input name="confirmationUrl"   type="hidden"  value="https://formatic.com.co/market/payment/payu/confirmation" />
<!--- PRUEBAS -->
<!--
        <input name="responseUrl"       type="hidden"  value="https://formatic.academy/dev-market/payment/payu/response" />
        <input name="confirmationUrl"   type="hidden"  value="https://formatic.academy/dev-market/payment/payu/confirmation" />
-->
    </form>
</body>
