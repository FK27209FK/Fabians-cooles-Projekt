extends Node3D

@export var showLabel = true

func interact():
	if showLabel:
		$"..".rotate_x(20)
		showLabel = !showLabel
