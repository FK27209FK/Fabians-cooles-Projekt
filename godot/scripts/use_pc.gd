extends StaticBody3D

@export var showLabel = true
@export var interactText = "PC Starten [E]"
@export var player: Player
@export var PC: Control
@export var UI: Control
@export var Mittelpunkt: ColorRect

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

func _on_pc_relay() -> void:
	PC.visible = false
	UI.visible = true
	player.capture_mouse()
	showLabel = true
	Mittelpunkt.visible = true
