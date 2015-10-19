<?= form_open("/metodos/actualizar/".$id) ?>
<?php 
	$nombre =array(
		'name' => 'nombre',
		'placeholder' => 'Escribe nombre',
		'value' => $curso->result()[0]->nombre
		);
	$obs =array(
		'name' =>'obs',
		'placeholder' => 'observaciones',
		'value' => $curso->result()[0]->observaciones
		);
 ?>
<?= form_label('Nombre:','nombre')?>
<?= form_input($nombre)?>
<br>
<?= form_label('observaciones:','obs')?>
<?= form_input($obs)?>
<br><br>
<?= form_submit('','Actualizar')  ?>
<?= form_close() ?>
</body>
</html>