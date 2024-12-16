extends StaticBody3D

@export var showLabel = true
@export var interactText = "Starten [E]"

func interact():
	if $"../Player".playerIsAlive && showLabel:
		showLabel = !showLabel
		#TODO: Computer-UI (#23)
		$"../Player".release_mouse()
		get_tree().change_scene_to_file("res://assets/Instances/PC.tscn")
	else:
		showLabel = false
		print("Player is not allowed to do this action!")
