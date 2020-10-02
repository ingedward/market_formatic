<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Confirmación Registro</title>
</head>
<body>
<?php
//    $link="https://formatic.com.co/platform/registro?0=".$pin.'&nP=1&correo='.$email.'&nombre=&apellido=&companie='.$company;

//    $link="https://formatic.com.co/dev-formatic/platform/registro?0=".$pin.'&nP=1&correo='.$email.'&nombre=&apellido=&companie='.$company;
    #---- link pruebas
    $link="https://formatic.academy/dev-formatic/platform/registro?0=".$pin.'&nP=1&correo='.$email.'&nombre=&apellido=&companie='.$company;

?>
<table style="background-color: #00000" width="1000" border="0" cellspacing="0" cellpadding="0" style="background-color: #000000">
    <tbody>
        <tr style="background-color: #7dba01;">
            <td style=" text-align: center; color: #fff;">
                <p style="padding-top: 16px; margin-bottom: 16px; font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size: 20px">
                    Hola 
                </p>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <a href="<?php echo $link; ?>">
                    <img data-imagetype="External" src="https://formatic.com.co/assets/emails/activeEmail/Excel-al-dia.png" width="100%" alt="Excel al dia" title="" border="0" style="display:block">
                </a>
            </td>
            <tr>
                <tr style="background-color: #7dba01 ; align-items: center">
                    <td style="width: 100%;">
                        <a href="<?php echo $link; ?>">
                            <p class="x_button-link" style=" align-content: center; margin-top: 30px; margin-bottom: 30px; margin-left: 360px; margin-right: 120px; 
background-color: #ffffff; width: 270px ; height: 25 px; padding-top: 20px ; padding-bottom: 20px ; 
border-radius: 10px 10px 10px 10px; font-family:Helvetica,Arial,sans; font-size:50px; font-weight:bold;
 text-align:center; text-decoration:none; color:inherit; color:#087b0b; font-size:20px; font-weight:bold;
  text-align:center; text-decoration:none; font-family:Helvetica; box-shadow: 0px 0px 5px black;">
                                Ingresa Aqu&#237;
                            </p>
                        </a>
                        <div style="width: 90%; margin: auto; text-align: center;">
                            <p class="help-center" style="color: rgb(255, 255, 255); font-family: Helvetica, Arial, sans-serif; font-size: 10px; font-weight: normal; line-height: 1.3; margin: 15px 0 10px; padding: 0; text-align: justify" align="left">
                                &iexcl;Bienvenido a formatic!. Adjunto encontrar&aacute;s los 
                                <a href="https://formatic.com.co/web/condiciones.html" style="color: #4E78F1; font-family: Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.3; margin: 0; padding: 0; text-align: left; text-decoration: none" target="_blank">T&eacute;rminos y Condiciones</a> de la Compra que has realizado. Adicionalmente, al utilizar el curso est&aacute;s aceptando nuestros <a href="https://formatic.com.co/web/condiciones.html" style="color: #4E78F1; font-family: Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.3; margin: 0; padding: 0; text-align: left; text-decoration: none" target="_blank">T&eacute;rminos de Servicio y Pol&iacute;tica de Privacidad.</a>. El curso que ya has adquirido tiene una duraci&oacute;n de 12 meses. Despu&eacute;s de este per&iacute;odo el curso ser&aacute; inhabilitado. Estamos seguros de que Formatic te encantar&aacute;, por eso te ofrecemos una garant&iacute;a absoluta. Si por cualquier raz&oacute;n, no est&aacute;s 100% convencido de nuestro contenido y de tu formaci&oacute;n puedes comunicarte dentro de los primeros 5 (cinco) d&iacute;as despu&eacute;s de la recepci&oacute;n de este material, simplemente contacta a uno de nuestros Asesores de Servicio, llamando al n&uacute;mero (+57) 304-607-7186, (+57) 322-417-4760 para cancelar tu compra. Despu&eacute;s del quinto d&iacute;a la aceptaci&oacute;n del contrato ser&aacute; definitiva. &iexcl;Felicidades de nuevo por tomar los primeros pasos en conseguir los conocimientos que te ayudar&aacute;n a triunfar! <a href="https://formatic.com.co" style="color: #4E78F1; font-family: Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.3; margin: 0; padding: 0; text-align: left; text-decoration: none" target="_blank">Formatic</a>.
                            </p>    
                        </div>
                    </td>
                </tr>
           </tr>
        </tr>
    </tbody>
</table>
</body> 
</html> 
