extends Node3D
@onready var animationplayer: AnimationPlayer = $AnimationPlayer
@onready var entered_zone:bool = false


func  _process(delta: float) -> void:
	
	if Input.is_action_pressed("interact") && entered_zone == true:
		print("playing")
		animationplayer.play("Tuer_oeffnen")
