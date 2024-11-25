extends StaticBody3D

@export var showLabel = true

func interact():
	if $"../Player".playerIsAlive && showLabel:
		showLabel = !showLabel
		#TODO: Computer-UI
		print("Using PC")
		$"../Alarmanlage".setAlarmanlage()
		#DEBUG:
		#$"../Player".game_over()
	else:
		showLabel = false
		print("Player is not allowed to do this action!")
