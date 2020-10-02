<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
  <html lang="en">
  <head>
    <title>Formatic</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--
    <LINK REL=StyleSheet HREF="../../../css/PayU/declined.css" TYPE="text/css" MEDIA=screen>
-->
    <LINK REL=StyleSheet HREF="<?php echo base_url('assets/css/declined.css'); ?>" TYPE="text/css" MEDIA=screen>

    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>    
  </head>
  <body class="bg-purple">      
    <div class="stars">
      <div class="central-body">
<!--
        <img class="logo" src="web/assets/img/logow.png">
-->
        <img class="logo" src="<?php echo base_url('assets/images/logow.png'); ?>">
        <h1 class="mesaje">Opps! Lo sentimos tu transacci&oacute;n fue rechazada</h1>
        <a href="https://formatic.com.co/market" class="btn-go-home">VOLVER AL INICIO</a>
      </div>
      <div class="objects">
        <img class="object_rocket" src="http://salehriaz.com/404Page/img/rocket.svg" width="40px">
        <div class="earth-moon">
          <img class="object_earth" src="http://salehriaz.com/404Page/img/earth.svg" width="100px">
          <img class="object_moon" src="http://salehriaz.com/404Page/img/moon.svg" width="80px">
        </div>
        <div class="box_astronaut">
          <img class="object_astronaut" src="http://salehriaz.com/404Page/img/astronaut.svg" width="140px">
        </div>
      </div>
      <div class="glowing_stars">
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
        <div class="star"></div>
      </div>
    </div>
  </body>
</html>