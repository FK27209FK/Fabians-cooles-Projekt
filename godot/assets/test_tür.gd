extends CSGBox3D

var showLabel = true

func interact():

	if ($"../../../Player/Camera/SchlüsselPoint".get_child_count() >= 1):
		print("Test Tür geöffnet!")
		
		get_tree().queue_delete($"../../../Player/Camera/SchlüsselPoint".get_child(0))
		get_tree().queue_delete(get_parent())
	else: 
		print("Du hast den Schlüssel nicht gefunden!")
	
	
