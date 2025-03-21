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
	get_parent().visible = false
	PlayerOwnsItem = true

func _process(_delta: float) -> void:
	if PlayerOwnsItem:
		$"../../DropControl".visible = true
		if Input.is_action_just_pressed("drop_item"):
			print("droping item")
			$"../../DropControl".visible = false
			PlayerOwnsItem = false
			droped = true
			currentposition= self.global_transform
			var item = preload("res://assets/Instances/taschenlampe.tscn").instantiate()
			item.global_transform = currentposition
			self.queue_free()
		if Input.is_action_just_released("toggle_item"):
			print("toggle")
			
	else:
		if !droped:
			$"../../DropControl".visible = false
