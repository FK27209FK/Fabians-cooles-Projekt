extends Control

signal relay
var Entsperrcode = "ERROR"
@onready var Alarmanlage = $wrapper4
@onready var Tueroeffnungsfenster = $wrapper8

func _on_reaktortimer_timer_aktualisieren(time) -> void:
	%Reaktortimer.text = time

func _on_exit_pressed() -> void:
	print(Entsperrcode)
	if Entsperrcode.to_int() == 9167:
		Alarmanlage.visible = false
		Tueroeffnungsfenster.visible = true
		Global.emit_signal("TuerOeffnen")
		print("PC: entsperrt")
		%Button.visible = false
		$wrapper4.visible = false

func _on_text_edit_text_changed() -> void:
	Entsperrcode = %TextEdit.text

func _on_exit_pressed2() -> void:
	Global.emit_signal("PCSchliessen")
