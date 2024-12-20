extends StaticBody3D

@export var showLabel = true
@export var interactText = "PC Starten [E]"

func interact():
	if %Player.playerIsAlive && showLabel:
		showLabel = !showLabel
		#Computer-UI (#23)
		%PC.visible = true
		%Player/UI.visible = false
		%Player.release_mouse()
		%Player/Camera/Interact/ColorRect.visible = false
	else:
		showLabel = false
		print("Player is not allowed to do this action!")

func _on_pc_relay() -> void:
	%PC.visible = false
	%Player/UI.visible = true
	%Player.capture_mouse()
	showLabel = true
	%Player/Camera/Interact/ColorRect.visible = true
