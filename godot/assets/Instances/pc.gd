extends Control

signal relay

func _on_exit_pressed() -> void:
	emit_signal("relay")


func _on_reaktortimer_timer_aktualisieren(time) -> void:
	%Reaktortimer.text = time
