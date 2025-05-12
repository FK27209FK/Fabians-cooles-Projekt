extends Control

signal relay

func _on_exit_pressed() -> void:
	emit_signal("relay")


func _on_reaktortimer_timer_aktualisieren(time) -> void:
	%Reaktortimer.text = time


func _on_button_pressed() -> void:
	pass # Replace with function body.
