extends Node3D

@export var showLabel = true
@export var switchActive = false
@onready var alarmanlage: Node3D = $"../../../Alarmanlage"


func interact():
	if showLabel && !switchActive: # && !alarmanlage.alarmanlageAktiv:
		$"..".rotate_x(20)
		switchActive = !switchActive
		Global.starterRaumTuerTrigger.emit()
	elif showLabel && switchActive:
		$"..".rotate_x(-20)
		switchActive = !switchActive
		Global.starterRaumTuerTrigger.emit()
