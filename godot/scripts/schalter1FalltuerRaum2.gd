extends Node3D

@export var showLabel = true
@export var switchActive = false
@onready var alarmanlage: Node3D = $"../../../../../Alarmanlage"

func interact():
	if showLabel && !switchActive && !alarmanlage.alarmanlageAktiv:
		$"..".rotate_x(20)
		switchActive = !switchActive
		#Animation für Falltür abspielen
		$"../../../Falltuer1/AnimationPlayer".play("falltuerOeffnen")
	elif showLabel && switchActive:
		$"..".rotate_x(-20)
		switchActive = !switchActive
		#Animation für Falltür rückwärts abspielen
		$"../../../Falltuer1/AnimationPlayer".play_backwards("falltuerOeffnen")
