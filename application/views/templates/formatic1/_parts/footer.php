<footer>
    <div class="footer-bottom">
        <div class="container">
            <p class="pull-left">
                <?= $footercopyright ?>
            </p>
            <div class="pull-right">
                <ul class="nav nav-pills payments">
                    <li><i class="fa fa-cc-visa"></i></li>
                    <li><i class="fa fa-cc-mastercard"></i></li>
                    <li><i class="fa fa-cc-amex"></i></li>
                    <li><i class="fa fa-cc-paypal"></i></li>
                </ul> 
            </div>
        </div>
    </div>
</footer>
<?php if ($this->session->flashdata('emailAdded')) { ?>
    <script>
        $(document).ready(function () {
            ShowNotificator('alert-info', '<?= lang('email_added') ?>');
        });
    </script>
    <?php
}
echo $addJs;
?>
</div>
</div>
<div id="notificator" class="alert"></div>
<script src="<?= base_url('assets/js/bootstrap.min.js') ?>"></script>
<script src="<?= base_url('assets/js/bootstrap-confirmation.min.js') ?>"></script>
<script src="<?= base_url('assets/bootstrap-select-1.12.1/js/bootstrap-select.min.js') ?>"></script>
<script src="<?= base_url('assets/js/placeholders.min.js') ?>"></script>
<script src="<?= base_url('assets/js/bootstrap-datepicker.min.js') ?>"></script>
<script>
var variable = {
    clearShoppingCartUrl: "<?= base_url('clearShoppingCart') ?>",
    manageShoppingCartUrl: "<?= base_url('manageShoppingCart') ?>",
    discountCodeChecker: "<?= base_url('discountCodeChecker') ?>"
};
</script>
<script src="<?= base_url('assets/js/system.js') ?>"></script>
<script src="<?= base_url('templatejs/mine.js') ?>"></script>
</body>
</html>
