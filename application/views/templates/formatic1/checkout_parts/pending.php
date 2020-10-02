<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
  <head><meta charset="gb18030">
    <title>Formatic</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--
    <LINK REL=StyleSheet HREF="../../../css/PayU/pending.css" TYPE="text/css" MEDIA=screen>
-->
    <link href="<?php echo base_url('assets/css/pending.css'); ?>" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>    
  </head>
  <body>
    <div class="container text-center">
<!--
      <img class="logo" src="web/assets/img/logow.png">
-->
      <img class="logo" src="<?php echo base_url('assets/images/logow.png'); ?>">

      <h1 class="title">Tu transacción esta siendo procesada
        comunicate con nosotros al (+57) 304-481-3788 para continuar con tu proceso
      </h1>
    </div>
    <div class="loading">
      <div class="loading-bar"></div>
      <div class="loading-bar"></div>
      <div class="loading-bar"></div>
      <div class="loading-bar"></div>
    </div>
    <div>
      <a href="https://formatic.com.co/market" class="btn-go-home">VOLVER AL INICIO</a>
    </div>
  </body>
</html>