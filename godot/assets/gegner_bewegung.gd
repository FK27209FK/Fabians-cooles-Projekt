extends Node3D

@onready var gegner: Node3D = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move = true
	var movespeed = 1
	var x_move = 1
	var z_move = 1
	if (move):
		gegner.position = gegner.position +  (Vector3(x_move,0,z_move) * delta * movespeed)
		
