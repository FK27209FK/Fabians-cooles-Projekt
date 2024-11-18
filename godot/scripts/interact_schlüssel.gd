extends StaticBody3D

var showLabel = true
const SCHL_SSEL_INSTANCE = preload("res://assets/Instances/schlüssel_instance.tscn")

func interact():
	var schlüssel = SCHL_SSEL_INSTANCE.instantiate()
	$"../../Player/Camera/SchlüsselPoint".add_child(schlüssel)
	
	get_tree().queue_delete(get_parent())
