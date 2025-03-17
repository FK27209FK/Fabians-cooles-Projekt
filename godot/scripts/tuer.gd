extends StaticBody3D

@onready var showLabel = true
@onready var interactText = "Tuer oeffnen [e]"

func interact():
	if interactText == "Tuer oeffnen [e]":
		$"../../AnimationPlayer".play("oeffnen")
		interactText = "Tuer schliessen [e]"
	else:
		$"../../AnimationPlayer".play_backwards("oeffnen")
		interactText = "Tuer oeffnen [e]"
