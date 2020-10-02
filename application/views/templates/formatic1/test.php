<style>
    .productos1 {
        background: url(<?= base_url('template/imgs/Fondo1.png') ?>) no-repeat fixed center;
    }
</style>

<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!--- ADICIONADO EDWARD -->
<div class="main-top">
    <img src="<?= base_url('template/imgs/Banner.png') ?>" class="img-responsive" alt="">
</div>
<!-- MODIFICADO EDWARD
<div class="container-fluid" id="home-page" style="background-image: url('https://formatic.academy/dev-purchase/assets/images/Fondo1.png');">
-->
<div class="row center-block" style="background-image: url('https://formatic.com.co/market/assets/imgs/Fondo1.png');">
    <div class="col-md-12 eqHeight" id="products-side">
        <?php
        if (!empty($products)) 
        {
            $load::getProductsFull($products, 'col-md-2 col-sm-2 col-xs-10', false);
        } 
        else 
        {
        ?>
            <script>
                $(document).ready(function () {
                    ShowNotificator('alert-info', '<?= lang('no_results') ?>');
                });
            </script>
            <?php
        }
        ?>
    </div>
</div>

<div style="background-image: url('https://formatic.com.co/market/assets/imgs/Fondo2.png');">
    <br>
    <div class="row" align="center">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <h1 style="color: #040342; font-size: 35px; font-weight: bold; font-style: italic;">
            ARMA EL COMBO QUE QUIERAS 
        </h1>
        <h2 style="color: #040342; font-size: 25px; font-weight: bold;">
            El segundo curso con el 
            <span style="color: #ff0000; font-size: 25px; font-weight: bold;">50% de descuento </span> 
        </h2>
      </div>
    </div>
    <div class="row center-block">
        <div class="col-md-12 eqHeight" id="products-side">
            <?php
            if (!empty($products)) 
            {
                $load::getProductsOfert($products, 'col-md-2 col-sm-2 col-xs-10', false);
            } 
            else 
            {
            ?>
                <script>
                    $(document).ready(function () {
                        ShowNotificator('alert-info', '<?= lang('no_results') ?>');
                    });
                </script>
            <?php
                }
            ?>
        </div>
    </div>
</div>

<!-- productos del mes Adicionado Edward 20200826-01-->
<div style="background-image: url('https://formatic.com.co/market/assets/imgs/Fondo3.png');">
    <br>
    <div class="row" align="center">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <h1 style="color: #040342; font-size: 35px; font-weight: bold; font-style: italic;">
            PRODUCTOS DEL MES 
        </h1>
      </div>
    </div>
    <div class="row center-block">
        <div class="col-md-12 eqHeight" id="products-side">
            <?php
            if (!empty($products)) 
            {
                $load::getProductsMonth($products, 'col-md-2 col-sm-2 col-xs-10', false);
            } 
            else 
            {
            ?>
                <script>
                    $(document).ready(function () {
                        ShowNotificator('alert-info', '<?= lang('no_results') ?>');
                    });
                </script>
            <?php
                }
            ?>
        </div>
    </div>
</div>

<!--
</div>
-->