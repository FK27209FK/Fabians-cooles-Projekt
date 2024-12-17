extends RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#if is_colliding() && get_collider().collision_layer & (1 << 2) && get_collider().showLabel:
	
	# Keine Ahnung warum .collision_layer 5 ist beim Stromkasten und so
	# Eigentlich ist da 1 und 3 an
	# - .collision_layer ist 5, da 5 ist binär: 101 , also erster und Dritter Bit sind true restlichen false weil default 0 
	if is_colliding() && get_collider().collision_layer == 5:
		var collider = get_collider()
		if "showLabel" in collider:
			$"../..".vis_true()
			var interactText
			$InteractControl/Label.text = "Interact [E]"
			if "interactText" in collider:
				var text = collider.interactText
				$InteractControl/Label.text = text
			if Input.is_action_just_pressed("interact"):
				get_collider().call("interact")
				$"../..".vis_false()
		else:
			if "showLabel" in get_collider().owner:
				$"../..".vis_true()
				var interactText
				$InteractControl/Label.text = "Interact [E]"
				if "interactText" in collider:
					var text = collider.interactText
					$InteractControl/Label.text = text
				if Input.is_action_just_pressed("interact"):
					$"../..".vis_false()
					get_collider().owner.interact(get_collider())
