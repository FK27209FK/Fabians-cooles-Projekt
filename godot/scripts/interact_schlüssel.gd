extends StaticBody3D

var showLabel = true
const SCHL_SSEL_INSTANCE = preload("res://assets/Instances/schlüssel_instance.tscn")
var interactText = "Schlüssel Aufheben [E]"

func interact():
	var schlüssel = SCHL_SSEL_INSTANCE.instantiate()
	%"SchlüsselPoint".add_child(schlüssel)
	get_tree().queue_delete(get_parent())
