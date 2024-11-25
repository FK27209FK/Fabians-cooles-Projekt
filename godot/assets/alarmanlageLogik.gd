extends Node3D

@onready var alarmanlageAktiv: bool = false
@onready var doorsToCloseIfAlarmanlageAktiv: Array[AnimationPlayer] = [
	$"../Räume/Raum 1/Tuer1/AnimationPlayer",
	$"../Räume/Raum 2/Tuer1/AnimationPlayer",
]
@onready var waitTime: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	waitTime += delta
	if waitTime > 1: #If not used -> significant impact on performance
		if alarmanlageAktiv:
			for door in doorsToCloseIfAlarmanlageAktiv:
				#TODO: Check if door is open (#45)
				door.play_backwards("oeffnen")
			alarmanlageAktiv = !alarmanlageAktiv
		waitTime = 0

func setAlarmanlage():
	alarmanlageAktiv = !alarmanlageAktiv
