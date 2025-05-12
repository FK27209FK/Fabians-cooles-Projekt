extends StaticBody3D

@export var showLabel = true;
@export var interactText = "(E) End Game";

func interact() -> void:
	get_tree().quit();
