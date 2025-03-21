extends Node3D
signal lichtAn
@onready var showLabel = true
@onready var lastpath
@onready var solved: int = 0
@export var interactText = "Verbinde alle Kabel [e]"

func interact(collider):
	var path = get_path_to(collider)
	path = str(path)
	path = path.replace("/StaticBody3D", "")
	if path != "Kasten" && (path.ends_with("O") or path.ends_with("U")):
		if ((path.replace("_O","_U") == lastpath) or (path.replace("_U","_O") == lastpath)) and path != lastpath:
			print("Kabel verbunden")
			var mitte = path
			mitte = mitte.replace("_O","_geloest")
			mitte = mitte.replace("_U","_geloest")
			mitte = NodePath(mitte)
			var node = get_node(mitte)
			node.visible = true
			solved = solved + 1
			if solved == 6:
				print("light")
				showLabel = false
				Global.emit_signal("BeleuchtungsfarbeAendern")
		else:
			lastpath = path	
