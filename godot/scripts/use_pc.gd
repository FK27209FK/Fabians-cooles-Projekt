extends StaticBody3D
#!!! Collision-layer !!!#

func interact():
	if $"../Player".playerIsAlive == true:
		#TODO: Computer-UI
		print("Using PC")
		#$"../AnimationPlayer".play("CubeBewegen")
		$"../Player".game_over()
	else:
		print("Player is not alive")
