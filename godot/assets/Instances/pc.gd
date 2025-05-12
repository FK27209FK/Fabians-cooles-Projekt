extends Control

signal relay
var Entsperrcode = "ERROR"

func _on_exit_pressed() -> void:
	emit_signal("relay")


func _on_reaktortimer_timer_aktualisieren(time) -> void:
	%Reaktortimer.text = time

func _on_button_pressed() -> void:
	if Entsperrcode == "9167":
		print("PC: entsperrt")
		%Button.visible = false
		$wrapper4.visible = false
		
		
func _on_text_edit_text_changed() -> void:
	Entsperrcode = %TextEdit.text
