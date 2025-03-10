extends Node3D

signal LichtAus
var PlayerOwnsItem = false
var showLabel = true
const Taschenlampen_INSTANCE = preload("res://assets/Instances/taschenlampe.tscn")
var interactText = "Taschenlampe Aufheben [E]"

#Test

func interact():
	var Taschenlampe = Taschenlampen_INSTANCE.instantiate()
	%Taschenlampenpoint.add_child(Taschenlampe)
	get_parent().visible = false
	PlayerOwnsItem = true

func _process(_delta: float) -> void:
	if PlayerOwnsItem:
		$"../../DropControl".visible = true
		if Input.is_action_just_pressed("drop_item"):
			print("test")
			$"../../DropControl".visible = false
		if Input.is_action_just_released("toggle_item"):
			print("toggle")
			
	else:
		$"../../DropControl".visible = false
