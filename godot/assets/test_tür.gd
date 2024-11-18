extends StaticBody3D

var showLabel = true

func interact():
	
	if ($"../../Player/Camera/SchlüsselPoint".get_child_count() >= 1):
		print("Test Tür geöffnet!")
		get_tree().queue_delete($"../../Player/Camera/SchlüsselPoint".get_child(0))
	else: 
		print("Du hast den Schlüssel nicht gefunden!")
	
	
