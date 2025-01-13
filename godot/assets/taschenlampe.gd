extends StaticBody3D

var showLabel = true
const Taschenlampen_INSTANCE = preload("res://assets/Instances/taschenlampe.tscn")
var interactText = "Taschenlampe Aufheben [E]"

func interact():
	var Taschenlampe = Taschenlampen_INSTANCE.instantiate()
	%Taschenlampenpoint.add_child(Taschenlampe)
	get_tree().queue_delete(get_parent())
