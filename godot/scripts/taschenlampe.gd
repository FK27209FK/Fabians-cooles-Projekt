extends Node3D

var PlayerOwnsItem = false
var showLabel = true
const Taschenlampen_INSTANCE = preload("res://assets/Instances/taschenlampe.tscn")
var interactText = "Taschenlampe Aufheben [E]"
var currentposition
var droped = false

func OwnsItem():
	PlayerOwnsItem = true

func _on_static_body_3d_licht_aus() -> void:
	$SpotLight3D.light_energy = 0
func _process(_delta: float) -> void:
	#$"../../DropControl".visible = true
	if Input.is_action_just_pressed("drop_item"):
		print("droping item")
		Global.emit_signal("DropVisible") # toggle to false
		PlayerOwnsItem = false
		droped = true
		currentposition= self.global_transform
		var item = preload("res://assets/Instances/taschenlampe.tscn").instantiate()
		item.global_transform = currentposition
		self.queue_free()
	if Input.is_action_just_released("toggle_item"):
		
		if (!PlayerOwnsItem): return
		
		if 	$SpotLight3D.light_energy != 0:
			$SpotLight3D.light_energy = 0
		else:
			$SpotLight3D.light_energy = 1
