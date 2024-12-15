extends Node3D

@onready var alarmanlageAktiv: bool = false
@onready var doors: Array[AnimationPlayer] = [
	$"../Räume/Raum 1/Tuer1/AnimationPlayer",
	$"../Räume/Raum 2/Tuer1/AnimationPlayer",
]
@onready var waitTime: float = 0
@onready var doorsToCloseIfAlarmanlageAktiv: Array[bool]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	doorsToCloseIfAlarmanlageAktiv.resize(doors.size())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	waitTime += delta
	if waitTime > 1: #If not used -> significant impact on performance
		if alarmanlageAktiv:
			#Check if door is open (#45)
			var door: int = 0
			while door < doors.size():
				if doorsToCloseIfAlarmanlageAktiv[door]:
					doors[door].play_backwards("oeffnen")
				door += 1
			alarmanlageAktiv = !alarmanlageAktiv
		waitTime = 0

func setAlarmanlage():
	alarmanlageAktiv = !alarmanlageAktiv
