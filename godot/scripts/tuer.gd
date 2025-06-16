extends StaticBody3D

@onready var showLabel = true
@onready var interactText = "Tür öffnen [e]"

func interact():
	pass
	
	if interactText == "Tür öffnen [e]":
		$"../../AnimationPlayer".play("oeffnen")
		interactText = "Tür schliessen [e]"
	else:
		$"../../AnimationPlayer".play_backwards("oeffnen")
		interactText = "Tür öffnen [e]"
