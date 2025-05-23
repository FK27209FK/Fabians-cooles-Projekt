extends Node3D

@export var showLabel = true
@export var interactText = "(E) Interact"
@export var player: Player
@export var PC: Control
@export var UI: Control
@export var Mittelpunkt: ColorRect


func _on_node_3d_pc_schliessen() -> void:
	PC.visible = false
	UI.visible = true
	player.capture_mouse()
	showLabel = true
	Mittelpunkt.visible = true

func _ready() -> void:
	Global.connect("PCSchliessen", _on_node_3d_pc_schliessen)
	
	PC.visible = false

func interact():
	if player.playerIsAlive && showLabel:
		showLabel = !showLabel
		PC.visible = true
		UI.visible = false
		player.release_mouse()
		Mittelpunkt.visible = false
	else:
		showLabel = false
		print("Player is not allowed to do this action!")
