extends Node3D

@export var showLabel = true
@export var switchActive = false

func interact():
	if showLabel && !switchActive:
		$"..".rotate_x(20)
		switchActive = !switchActive
		$"../../../Räume/Raum 1/tuer1/AnimationPlayer".play("tuerOeffnen")
	elif showLabel && switchActive:
		$"..".rotate_x(-20)
		switchActive = !switchActive
		$"../../../Räume/Raum 1/tuer1/AnimationPlayer".play_backwards("tuerOeffnen")
