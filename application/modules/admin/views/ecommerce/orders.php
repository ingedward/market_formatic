<link href="<?= base_url('assets/css/bootstrap-toggle.min.css') ?>" rel="stylesheet">
<div>
    <h1>
        <img src="<?= base_url('assets/imgs/orders.png') ?>" class="header-img" style="margin-top:-2px;"> 
        Pedidos <?= isset($_GET['settings']) ? ' / Settings' : '' ?>
    </h1>
    <?php if (!isset($_GET['settings'])) { ?>
        <a href="?settings" class="pull-right orders-settings">
            <i class="fa fa-cog" aria-hidden="true"></i> 
            <span>Configuración</span>
        </a>
    <?php } else { ?>
        <a href="<?= base_url('admin/orders') ?>" class="pull-right orders-settings"><i class="fa fa-angle-left" aria-hidden="true"></i> <span>Volver</span></a>
    <?php } ?>
</div>
<hr>

<?php
if (!isset($_GET['settings'])) 
{
    if (!empty($orders)) 
    {
?>
    <div class="row">
        <div class="col-md-6" style="margin-bottom:10px;">
            <select class="selectpicker changeOrder">
                <option <?= isset($_GET['order_by']) && $_GET['order_by'] == 'id' ? 'selected' : '' ?> value="id">
                    Ordenar por más reciente
                </option>
                <option <?= (isset($_GET['order_by']) && $_GET['order_by'] == 'processed') || !isset($_GET['order_by']) ? 'selected' : '' ?> value="processed">
                    Pedidos sin procesar
                </option>
            </select>
        </div>
        <!-- Adicionado Edward Descargar en Excel 20200901-01  -->
        <div class="col-md-6" align="right">
            <a class="btn btn-default buttons-excel buttons-html5" tabindex="0" aria-controls="registerTable" href="<?= base_url('admin/orders/download') ?>">
                <span>Excel</span>
            </a>
        </div>
    </div>

        <div class="table-responsive">
            <table class="table table-condensed table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Pedido ID</th>
                        <th>Fecha</th>
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Ver</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    foreach ($orders as $tr) 
                    {
                        if ($tr['processed'] == 0) 
                        {
                            $class = 'bg-danger';
                            $type = 'No processed';
                        }
                        if ($tr['processed'] == 1) 
                        {
                            $class = 'bg-success';
                            $type = 'Processed';
                        }
                        if ($tr['processed'] == 2) 
                        {
                            $class = 'bg-warning';
                            $type = 'Rejected';
                        }
                        ?>
                        <tr>
                            <td class="relative" id="order_id-id-<?= $tr['order_id'] ?>">
                                # <?= $tr['order_id'] ?>
                                <?php if ($tr['viewed'] == 0) { ?>
                                    <div id="new-order-alert-<?= $tr['id'] ?>">
                                        <img src="<?= base_url('assets/imgs/new-blinking.gif') ?>" style="width:100px;" alt="blinking">
                                    </div>
                                <?php } ?>
                                <div class="confirm-result">
                                    <?php if ($tr['confirmed'] == '1') { ?>
                                        <span class="label label-success">Confirmados por email</span>
                                    <?php } else { ?> 
                                        <span class="label label-danger">No Confirmados</span> 
                                    <?php } ?>
                                </div>
                            </td>
                            <td><?= date('d.M.Y / H:i:s', $tr['date']); ?></td>
                            <td>
                                <i class="fa fa-user" aria-hidden="true"></i> 
                                <?= $tr['first_name'] . ' ' . $tr['last_name'] ?>
                            </td>
                            <td><i class="fa fa-phone" aria-hidden="true"></i> <?= $tr['phone'] ?></td>
                            <td class="<?= $class ?> text-center" data-action-id="<?= $tr['id'] ?>">
                                <div class="status" style="padding:5px; font-size:16px;">
                                    -- <b><?= $type ?></b> --
                                </div>
                                <div style="margin-bottom:4px;">
                                    <a href="javascript:void(0);" onclick="changeOrdersOrderStatus(<?= $tr['id'] ?>, 1, '<?= htmlentities($tr['products']) ?>', '<?= $tr['email'] ?>')" class="btn btn-success btn-xs">
                                        Procesado
                                    </a>
                                </div>
                                <div style="margin-bottom:4px;">
                                    <a href="javascript:void(0);" onclick="changeOrdersOrderStatus(<?= $tr['id'] ?>, 0)" class="btn btn-danger btn-xs">
                                        No procesado
                                    </a>
                                </div>
                                <div style="margin-bottom:4px;">
                                    <a href="javascript:void(0);" onclick="changeOrdersOrderStatus(<?= $tr['id'] ?>, 2)" class="btn btn-warning btn-xs">
                                        Rechazado
                                    </a>
                                </div>
                            </td>
                            <td class="text-center">
                                <a href="javascript:void(0);" class="btn btn-default more-info" data-toggle="modal" data-target="#modalPreviewMoreInfo" style="margin-top:10%;" data-more-info="<?= $tr['order_id'] ?>">
                                    Más Info 
                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                </a>
                            </td>
                            <td class="hidden" id="order-id-<?= $tr['order_id'] ?>">
                                <div class="table-responsive">
                                    <table class="table more-info-purchase">
                                        <tbody>
                                            <tr>
                                                <td><b>Email</b></td>
                                                <td>
                                                    <a href="mailto:<?= $tr['email'] ?>">
                                                        <?= $tr['email'] ?>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Nombre</b></td>
                                                <td>
                                                    <?= $tr['first_name'] ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Apellido</b></td>
                                                <td>
                                                    <?= $tr['last_name'] ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Tipo documento</b></td>
                                                <td><?= $tr['document_type'] ?></td>
                                            </tr>
                                            <tr>
                                                <td><b>Número documento</b></td>
                                                <td><?= $tr['document_number'] ?></td>
                                            </tr>
                                            <tr>
                                                <td><b>Ciudad</b></td>
                                                <td><?= $tr['city'] ?></td>
                                            </tr>
                                            <tr>
                                                <td><b>Dirección</b></td>
                                                <td><?= $tr['address'] ?></td>
                                            </tr>
                                            <tr>
                                                <td><b>Código postal</b></td>
                                                <td><?= $tr['post_code'] ?></td>
                                            </tr>
                                            <tr>
                                                <td><b>Nota</b></td>
                                                <td><?= $tr['notes'] ?></td>
                                            </tr>
                                            <tr>
                                                <td><b>Origen</b></td>
                                                <td>
                                                    <?php if ($tr['referrer'] != 'Direct') { ?>
                                                        <a target="_blank" href="<?= $tr['referrer'] ?>" class="orders-referral">
                                                            <?= $tr['referrer'] ?>
                                                        </a>
                                                    <?php } else { ?>
                                                        Direct traffic or referrer is not visible                       
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>Tipo de pago</b></td>
                                                <td><?= $tr['payment_type'] ?></td>
                                            </tr>
                                            <tr>
                                                <td><b>Descuento</b></td>
                                                <td><?= $tr['discount_type'] == 'float' ? '-' . $tr['discount_amount'] : '-' . $tr['discount_amount'] . '%' ?></td>
                                            </tr>
                                            <?php if ($tr['payment_type'] == 'PayPal') { ?>
                                                <tr>
                                                    <td><b>Estado PayPal </b></td>
                                                    <td><?= $tr['paypal_status'] ?></td>
                                                </tr>
                                            <?php } ?>
                                            <?php if ($tr['payment_type'] == 'Payu') { ?>
                                                <tr>
                                                    <td><b>Estado PayU </b></td>
                                                    <td><?= $tr['payu_status'] ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Método pago </b></td>
                                                    <td><?= $tr['payu_method_name'] ?></td>
                                                </tr>
                                            <?php } ?>
                                            <tr>
                                                <td colspan="2"><b>Productos</b></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <?php
                                                    $arr_products = unserialize($tr['products']);
                                                    foreach ($arr_products as $product) {
                                                        $total_amount = 0;
                                                        $total_amount += str_replace(' ', '', str_replace(',', '.',$product['product_info']['price']));
                                                        ?>
                                                        <div style="word-break: break-all;">
                                                            <div>
                                                                <img src="<?= base_url('attachments/shop_images/' . $product['product_info']['image']) ?>" alt="Product" style="width:100px; margin-right:10px;" class="img-responsive">
                                                            </div>
                                                            <a data-toggle="tooltip" data-placement="top" title="Click to preview" target="_blank" href="<?= base_url($product['product_info']['url']) ?>">
                                                                <?= base_url($product['product_info']['url']) ?>
                                                                <div style=" background-color: #f1f1f1; border-radius: 2px; padding: 2px 5px;">
                                                                    <b>Cantidad:</b> <?= $product['product_quantity'] ?> / 
                                                                    <b>Precio: <?= $product['product_info']['price'].' '.$this->config->item('currency') ?></b>
                                                                </div>
                                                            </a>
                                                            <div class="">
                                                                <b>Vendedor:</b>
                                                                <a href=""><?= $product['product_info']['vendor_name'] ?></a>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div style="padding-top:10px; font-size:16px;">
                                                            Monto total de productos: <?= $total_amount.' '.$this->config->item('currency') ?>
                                                        </div>
                                                        <hr>
                                                    <?php }
                                                    ?>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
        <?= $links_pagination ?>
    <?php } else { ?>
        <div class="alert alert-info">No hay pedidos en el momento!</div>
    <?php }
    ?>        
    <hr>
    <?php
}
if (isset($_GET['settings'])) 
{
    ?>
    <h3>Contra entrega</h3>
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Change visibility of this purchase option</div>
                <div class="panel-body">
                    <?php if ($this->session->flashdata('cashondelivery_visibility')) { ?>
                        <div class="alert alert-info"><?= $this->session->flashdata('cashondelivery_visibility') ?></div>
                    <?php } ?>
                    <form method="POST" action="">
                        <input type="hidden" name="cashondelivery_visibility" value="<?= $cashondelivery_visibility ?>">
                        <input <?= $cashondelivery_visibility == 1 ? 'checked' : '' ?> data-toggle="toggle" data-for-field="cashondelivery_visibility" class="toggle-changer" type="checkbox">
                        <button class="btn btn-default" value="" type="submit">
                            Save
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <h3>Paypal Account Settings</h3>
    <div class="row">
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">Paypal sandbox mode (use for paypal account tests)</div>
                <div class="panel-body">
                    <?php if ($this->session->flashdata('paypal_sandbox')) { ?>
                        <div class="alert alert-info"><?= $this->session->flashdata('paypal_sandbox') ?></div>
                    <?php } ?>
                    <form method="POST" action="">
                        <input type="hidden" name="paypal_sandbox" value="<?= $paypal_sandbox ?>">
                        <input <?= $paypal_sandbox == 1 ? 'checked' : '' ?> data-toggle="toggle" data-for-field="paypal_sandbox" class="toggle-changer" type="checkbox">
                        <button class="btn btn-default" value="" type="submit">
                            Save
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">Paypal business email</div>
                <div class="panel-body">
                    <?php if ($this->session->flashdata('paypal_email')) { ?>
                        <div class="alert alert-info"><?= $this->session->flashdata('paypal_email') ?></div>
                    <?php } ?>
                    <form method="POST" action="">
                        <div class="input-group">
                            <input class="form-control" placeholder="Leave empty for no paypal available method" name="paypal_email" value="<?= $paypal_email ?>" type="text">
                            <span class="input-group-btn">
                                <button class="btn btn-default" value="" type="submit">
                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div> 
    </div>
    <hr>
    <h3>Bank Account Settings</h3>
    <div class="row">
        <div class="col-sm-6">
            <?php if ($this->session->flashdata('bank_account')) { ?>
                <div class="alert alert-info"><?= $this->session->flashdata('bank_account') ?></div>
            <?php } ?>
            <form method="POST" action="">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td colspan="2"><b>Pay to - Recipient name/ltd</b></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" name="name" value="<?= $bank_account != null ? $bank_account['name'] : '' ?>" class="form-control" placeholder="Example: BoxingTeam Ltd."></td>
                            </tr>
                            <tr>
                                <td><b>IBAN</b></td>
                                <td><b>BIC</b></td>
                            </tr>
                            <tr>
                                <td><input type="text" class="form-control" value="<?= $bank_account != null ? $bank_account['iban'] : '' ?>" name="iban" placeholder="Example: BG11FIBB329291923912301230"></td>
                                <td><input type="text" class="form-control" value="<?= $bank_account != null ? $bank_account['bic'] : '' ?>" name="bic" placeholder="Example: FIBBGSF"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><b>Bank</b></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="text" value="<?= $bank_account != null ? $bank_account['bank'] : '' ?>" name="bank" class="form-control" placeholder="Example: First Investment Bank"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <input type="submit" class="form-control" value="Save Bank Account Settings">
            </form>
        </div>
    </div>
<?php } ?>
<!-- Modal for more info buttons in orders -->
<div class="modal fade" id="modalPreviewMoreInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Preview <b id="client-name"></b></h4>
            </div>
            <div class="modal-body" id="preview-info-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<script src="<?= base_url('assets/js/bootstrap-toggle.min.js') ?>"></script>
