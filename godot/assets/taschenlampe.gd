extends Node3D

var PlayerOwnsItem = false
var showLabel = true
const Taschenlampen_INSTANCE = preload("res://assets/Instances/taschenlampe.tscn")
var interactText = "Taschenlampe Aufheben [E]"
var currentposition
var droped = false

func interact():
	var Taschenlampe = Taschenlampen_INSTANCE.instantiate()
	%Taschenlampenpoint.add_child(Taschenlampe)
	PlayerOwnsItem = true
	Global.emit_signal("DropVisible") # einschalten
	get_parent().queue_free()
