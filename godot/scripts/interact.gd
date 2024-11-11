extends RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_colliding() && get_collider().collision_layer & (1 << 2) && get_collider().showLabel:
		#print("show label")
		$"../..".vis_true()
		if Input.is_action_just_pressed("interact"):
			get_collider().call("interact")
			$"../..".vis_false()
