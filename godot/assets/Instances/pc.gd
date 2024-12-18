extends Control

signal relay

func _on_exit_pressed() -> void:
	emit_signal("relay")
