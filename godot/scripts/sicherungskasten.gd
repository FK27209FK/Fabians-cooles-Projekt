extends Node3D
@onready var showLabel = true
@onready var collider

func interact(collider):
	var path = get_path_to(collider)
	path = str(path)
	path = path.replace("/StaticBody3D", "")
	path = NodePath(path)
	var node = get_node(path)
	node.visible = false
	print(node)
