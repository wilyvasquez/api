<?= form_open('/metodos/recibirDatos')  ?>
<?php
	$nombre = array(
		'name' =>'nombre' ,
		'placeholder' => 'nombre'
	);

	$obs = array(
		'name' =>'obs' ,
		'placeholder' => 'observaciones'
	);
?>
<?= form_label('Nombre:','nombre')?>
<?= form_input($nombre)?>
<br>
<?= form_label('observaciones:','obs')?>
<?= form_input($obs)?>
<br>
<?= form_submit('','subir')  ?>
<?= form_close() ?>
</body>
</html>