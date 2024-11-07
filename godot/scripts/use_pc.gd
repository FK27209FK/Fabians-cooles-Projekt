extends StaticBody3D

@export var showLabel = true

func interact():
	if $"../Player".playerIsAlive == true && showLabel:
		showLabel = !showLabel
		#TODO: Computer-UI
		print("Using PC")
		#$"../AnimationPlayer".play("CubeBewegen")
		$"../Player".game_over()
	else:
		print("Player is not allowed to do this action!")
