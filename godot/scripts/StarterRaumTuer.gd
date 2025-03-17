extends Node3D
@onready var TuerOffen = false

func _ready():
	Global.connect("starterRaumTuerTrigger", self._on_starterRaumTuerTrigger)
func _on_starterRaumTuerTrigger():
	print("Signal: starterRaumTuerTrigger empfangen!")
	if !TuerOffen:
		%AnimationPlayer.play("oeffnen")
		TuerOffen = !TuerOffen
	else:
		%AnimationPlayer.play_backwards("oeffnen")
		TuerOffen = !TuerOffen
