extends StaticBody3D

@onready var showLabel = true
@onready var interactText = "Diese Tuer kann nicht per Hand geoeffnet werden"

func interact():
	print("Unable to open door by hand")
