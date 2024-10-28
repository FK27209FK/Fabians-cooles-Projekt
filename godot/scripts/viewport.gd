extends SubViewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Optional: Initialization code here
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Access the size of a node named 'Interact' inside the SubViewport
	var interact_node = $Interact
	if interact_node:
		size = interact_node.size
		print("Size of Interact node:", size)
