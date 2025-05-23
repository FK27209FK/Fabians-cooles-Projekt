extends Control

func _ready() -> void:
	$Story.visible = false
	$Steuerung.visible = false

func _on_main_button_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/node_3d.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_steuerung_button_pressed() -> void:
	$Steuerung.visible = !$Steuerung.visible


func _on_story_button_pressed() -> void:
	$Story.visible = !$Story.visible
