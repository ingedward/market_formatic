<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<div class="container" id="checkout-page">
    <?php
    if ($cartItems['array'] != null) 
    {
        ?>
        <?= purchase_steps(1, 2) ?>
        <div class="row">
            <div class="col-sm-9 left-side">
                <form method="POST" id="goOrder">
                    <div class="title alone">
                        <span><?= lang('checkout') ?></span>
                    </div>
                    <?php
                    if ($this->session->flashdata('submit_error')) 
                    {
                        ?>
                        <hr>
                        <div class="alert alert-danger">
                            <h4>
                                <span class="glyphicon glyphicon-alert"></span> 
                                <?= lang('finded_errors') ?>
                            </h4>
                            <?php
                                foreach ($this->session->flashdata('submit_error') as $error) 
                                {
                                    echo $error . '<br>';
                                }
                            ?>
                        </div>
                        <hr>
                        <?php
                    }
                    ?>
                    <div class="payment-type-box">
                        <select class="selectpicker payment-type" data-style="btn-blue" name="payment_type">
                            <!-- Adicionado  edward -->
                            <option value="Payu">
                                Payu
                            </option>
                            <!-- Adicionado  edward para pruebas 20200902-->
                            <option value="PayuTest">
                                Payu Pruebas
                            </option>
                            <!-- Adicionado  edward para pruebas 20200928-->
                            <option value="ePayco">
                                ePayco
                            </option>
                            <!-- Elimino las otras opciones -->
                        </select>
                        <span class="top-header text-center">
                            <?= lang('choose_payment') ?>
                        </span>
                    </div>
                    <div class="row">
                        <!-- Adicionados Edward 202008 -->
                        <div class="form-group col-sm-6">
                            <label for="documentNumber">
                                Tipo documento (<sup><?= lang('requires') ?></sup>)
                            </label>
                            <select class="form-control" name="document_type">
                                <option value="cc">Cédula ciudadanía</option>                                
                                <option value="nit">Nit</option>
                                <option value="pasaporte">Pasaporte</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="documentNumber">
                                Documento (<sup><?= lang('requires') ?></sup>)
                            </label>
                            <input id="documentNumber" class="form-control" name="document" value="<?= @$_POST['document'] ?>" type="text" placeholder="Documento">
                        </div>

                        <div class="form-group col-sm-6">
                            <label for="firstNameInput">
                                <?= lang('first_name') ?> (<sup><?= lang('requires') ?></sup>)
                            </label>
                            <input id="firstNameInput" class="form-control" name="first_name" value="<?= @$_POST['first_name'] ?>" type="text" placeholder="<?= lang('first_name') ?>">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="lastNameInput">
                                <?= lang('last_name') ?> (<sup><?= lang('requires') ?></sup>)
                            </label>
                            <input id="lastNameInput" class="form-control" name="last_name" value="<?= @$_POST['last_name'] ?>" type="text" placeholder="<?= lang('last_name') ?>">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="emailAddressInput">
                                <?= lang('email_address') ?> (<sup><?= lang('requires') ?></sup>)
                            </label>
                            <input id="emailAddressInput" class="form-control" name="email" value="<?= @$_POST['email'] ?>" type="text" placeholder="<?= lang('email_address') ?>">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="phoneInput">
                                <?= lang('phone') ?> (<sup><?= lang('requires') ?></sup>)
                            </label>
                            <input id="phoneInput" class="form-control" name="phone" value="<?= @$_POST['phone'] ?>" type="text" placeholder="<?= lang('phone') ?>">
                        </div>
                        <input type="hidden" name="notes" value="">
                        <div class="form-group col-sm-12">
                            <label for="addressInput">
                                <?= lang('address') ?> (<sup><?= lang('requires') ?></sup>)
                            </label>
                            <textarea id="addressInput" name="address" class="form-control" rows="3"><?= @$_POST['address'] ?></textarea>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="cityInput">
                                <?= lang('city') ?> (<sup><?= lang('requires') ?></sup>)
                            </label>
                            <input id="cityInput" class="form-control" name="city" value="<?= @$_POST['city'] ?>" type="text" placeholder="<?= lang('city') ?>">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="postInput"><?= lang('post_code') ?></label>
                            <input id="postInput" class="form-control" name="post_code" value="<?= @$_POST['post_code'] ?>" type="text" placeholder="<?= lang('post_code') ?>">
                        </div>
<!-- Comentareado Edward 
                        <div class="form-group col-sm-12">
                            <label for="notesInput"><?= lang('notes') ?></label>
                            <textarea id="notesInput" class="form-control" name="notes" rows="3"><?= @$_POST['notes'] ?></textarea>
                        </div>
-->
                    </div>
                    <?php 
                        if ($codeDiscounts == 1) 
                        { 
                    ?>
                        <div class="discount">
                            <label><?= lang('discount_code') ?></label>
                            <input class="form-control" name="discountCode" value="<?= @$_POST['discountCode'] ?>" placeholder="<?= lang('enter_discount_code') ?>" type="text">
                            <a href="javascript:void(0);" class="btn btn-default" onclick="checkDiscountCode()"><?= lang('check_code') ?></a>
                        </div>
                    <?php } ?>
                    <div class="table-responsive">
                        <table class="table table-bordered table-products">
                            <thead>
                                <tr>
                                    <th><?= lang('product') ?></th>
                                    <th><?= lang('title') ?></th>
                                    <th><?= lang('quantity') ?></th>
                                    <th><?= lang('price') ?></th>
                                    <th><?= lang('total') ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                    foreach ($cartItems['array'] as $item) 
                                    { 
                                ?>
                                    <tr>
                                        <td class="relative">
                                            <input type="hidden" name="id[]" value="<?= $item['id'] ?>">
                                            <input type="hidden" name="quantity[]" value="<?= $item['num_added'] ?>">
                                            <!-- Adicionado Edward -->
                                            <input type="hidden" name="price[]" value="<?= $item['price'] ?>">


                                            <img class="product-image" src="<?= base_url('/attachments/shop_images/' . $item['image']) ?>" alt="">
                                            <a href="<?= base_url('home/removeFromCart?delete-product=' . $item['id'] . '&back-to=checkout') ?>" class="btn btn-xs btn-danger remove-product">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<?= LANG_URL . '/' . $item['url'] ?>"><?= $item['title'] ?>
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-xs btn-primary refresh-me add-to-cart <?= $item['quantity'] <= $item['num_added'] ? 'disabled' : '' ?>" data-id="<?= $item['id'] ?>" href="javascript:void(0);">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </a>
                                            <span class="quantity-num">
                                                <?= $item['num_added'] ?>
                                            </span>
                                            <a class="btn  btn-xs btn-danger" onclick="removeProduct(<?= $item['id'] ?>, true)" href="javascript:void(0);">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </a>
                                        </td>
                                        <td><?= $item['price'] . CURRENCY ?></td>
                                        <td><?= $item['sum_price'] . CURRENCY ?></td>
                                    </tr>
                                <?php } ?>
                                <tr>
                                    <td colspan="4" class="text-right"><?= lang('total') ?></td>
                                    <td>
                                        <span class="final-amount"><?= $cartItems['finalSum'] ?></span><?= CURRENCY ?>
                                        <input type="hidden" class="final-amount" name="final_amount" value="<?= $cartItems['finalSum'] ?>">
                                        <input type="hidden" name="amount_currency" value="<?= CURRENCY ?>">
                                        <input type="hidden" name="discountAmount" value="">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div>
                    <a href="<?= LANG_URL ?>" class="btn btn-primary go-shop">
                        <span class="glyphicon glyphicon-circle-arrow-left"></span>
                        <?= lang('back_to_shop') ?>
                    </a>
                    <!-- boton de pagar -->
                    <a href="javascript:void(0);" class="btn btn-primary go-order" onclick="document.getElementById('goOrder').submit();" class="pull-left">
                        <?= lang('custom_order') ?> 
                        <span class="glyphicon glyphicon-circle-arrow-right"></span>
                    </a>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-sm-3"> 
                <div class="filter-sidebar">
                    <div class="title">
                        <span><?= lang('best_sellers') ?></span>
                        <i class="fa fa-trophy" aria-hidden="true"></i>
                    </div>
                    <?= $load::getProducts($bestSellers, '', true) ?>
                </div>
            </div>
        </div>
    </div>
<?php } else { ?>
    <div class="alert alert-info"><?= lang('no_products_in_cart') ?></div>
    <?php
}
if ($this->session->flashdata('deleted')) {
    ?>
    <script>
        $(document).ready(function () {
            ShowNotificator('alert-info', '<?= $this->session->flashdata('deleted') ?>');
        });
    </script>
<?php } if ($codeDiscounts == 1 && isset($_POST['discountCode'])) { ?>
    <script>
        $(document).ready(function () {
            checkDiscountCode();
        });
    </script>
<?php } ?>