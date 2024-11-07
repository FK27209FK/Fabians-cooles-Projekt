extends StaticBody3D

@export var showLabel = true

func _ready() -> void:
	$"../DirectionalLight3D".light_energy = 0.5
	$StromkastenUngeloest.show()
	$ungeloest_collisionshape.show()
	$StromkastenGeloest.hide()
	$StromkastenGeloest_collision_shape.hide()

func interact():
	if $StromkastenUngeloest.visible == true && showLabel:
		showLabel = !showLabel
		$StromkastenUngeloest.hide()
		$ungeloest_collisionshape.hide()
		
		$StromkastenGeloest.show()
		$StromkastenGeloest_collision_shape.show()
		$".".set_collision_layer_value(3,false	)
		while $"../DirectionalLight3D".light_energy < 2:
			await get_tree().create_timer(0.05).timeout #wait 0.05 Seconds
			$"../DirectionalLight3D".light_energy = $"../DirectionalLight3D".light_energy + 0.1
	else:
		pass
		
