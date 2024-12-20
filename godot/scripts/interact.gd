extends RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_colliding() && get_collider().collision_layer == 5:# .collision_layer ist 5, da 5 ist binär: 101 , also erster und Dritter Bit sind true restlichen false weil default 0 
		var collider = get_collider()
		if "showLabel" in collider && get_collider().showLabel:
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
			if "showLabel" in get_collider().owner && get_collider().owner.showLabel:
				$"../..".vis_true()
				var interactText
				$InteractControl/Label.text = "Interact [E]"
				if "interactText" in collider.owner:
					var text = collider.owner.interactText
					$InteractControl/Label.text = text
				if Input.is_action_just_pressed("interact"):
					$"../..".vis_false()
					get_collider().owner.interact(get_collider())
