extends StaticBody3D

@export var showLabel = true

func interact():
	if $"../Player".playerIsAlive && showLabel:
		showLabel = !showLabel
		#TODO: Computer-UI (#23)
		$"../Alarmanlage".setAlarmanlage()
	else:
		showLabel = false
		print("Player is not allowed to do this action!")
