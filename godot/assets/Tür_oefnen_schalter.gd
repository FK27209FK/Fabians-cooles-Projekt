extends Node3D

@export var showLabel = true
@export var switchActive = false
@onready var alarmanlage: Node3D = $"../../../Alarmanlage"

func interact():
	if showLabel && !switchActive && !alarmanlage.alarmanlageAktiv:
		$"..".rotate_x(20)
		switchActive = !switchActive
		$"../../../Räume/Raum 1/Tuer1/AnimationPlayer".play("oeffnen")
	elif showLabel && switchActive:
		$"..".rotate_x(-20)
		switchActive = !switchActive
		$"../../../Räume/Raum 1/Tuer1/AnimationPlayer".play_backwards("oeffnen")
