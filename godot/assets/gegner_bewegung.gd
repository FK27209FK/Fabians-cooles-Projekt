extends CharacterBody3D

@onready var player: Player = $"../Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move = true
	var movespeed = 50
	var x_move = player.global_position.x - global_position.x
	var z_move = player.global_position.z - global_position.z

	if move:
		# Set the velocity vector, adjusting for delta
		velocity.x = x_move * delta * movespeed
		velocity.z = z_move * delta * movespeed
		
		# Move the character with collision handling
		move_and_slide()
