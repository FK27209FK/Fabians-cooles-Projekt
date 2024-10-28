extends StaticBody3D


func interact():
	if $StromkastenUngeloest.visible == true:
		$StromkastenUngeloest.hide()
		$ungeloest_collisionshape.hide()
		
		$StromkastenGeloest.show()
		$StromkastenGeloest_collision_shape.show()
		$".".set_collision_layer_value(3,false	)
	else:
		pass
		
