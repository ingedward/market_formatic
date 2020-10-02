<table style="background: #303030;color: #fff;border-radius: 6px;width: 1000px;
font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
border-left-width: 30px;padding-left: 30px;padding-top: 30px;padding-right: 30px;padding-bottom: 30px;">
    <tbody style="margin: 30px">
        <tr>
            <td style="border-color:#fff;margin: 30px">
                <p>Nombre   : <?php echo $nombre; ?></p>
                <p>Apellido : <?php echo $apellido; ?></p>
                <p>Correo   : <?php echo $correo; ?></p>
                <p>Empresa  : <?php echo $companie; ?></p>
                <p>Pedido   : <?php echo $pedido;?> </p>
                <p>Libranza : <?php echo $libranza;?></p>
            </td>
        </tr>
        <tr style="margin: 30px; width: 1000px; margin-bottom: 30px">
            <td style="width: 500px">
            <p style="padding-top: 30px">Cursos</p>
            <?php foreach ($nombreCursos as $nombr): ?>
                <li><?php echo $nombr ?></li>
            <?php endforeach ?>
            </td>
            <td style="width: 500px">
            <p style="padding-top: 30px">PIN</p>
            <?php foreach ($pines as $pin): ?>
                <li><?php echo $pin ?></li>
            <?php endforeach ?>
            </td>
        </tr>
    </tbody>
</table>