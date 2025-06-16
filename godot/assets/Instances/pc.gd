extends Control

signal relay

var Entsperrcode = "ERROR"
@onready var Alarmanlage = $wrapper4
@onready var Tueroeffnungsfenster = $wrapper8

func _ready() -> void:
	$"Falscher Code eingegeben".visible = false
	$"Falscher Code eingegeben2".visible = false

func _on_reaktortimer_timer_aktualisieren(time) -> void:
	%Reaktortimer.text = time

func _on_exit_pressed() -> void:
	print(Entsperrcode)
	if Entsperrcode.length() < 8:
		$"Falscher Code eingegeben2".visible = true
	else:
		$"Falscher Code eingegeben2".visible = false
		if Entsperrcode.to_int() == 91671632:
			Alarmanlage.visible = false
			$Lock.visible = false
			Tueroeffnungsfenster.visible = true
			Global.emit_signal("TuerOeffnen")
			print("PC: entsperrt")
			%Button.visible = false
			$wrapper4.visible = false
			$"Falscher Code eingegeben".visible = false
		else:
			$"Falscher Code eingegeben".visible = true

func _on_exit_pressed2() -> void:
	$"Falscher Code eingegeben".visible = false
	$"Falscher Code eingegeben2".visible = false
	Global.emit_signal("PCSchliessen")


func _on_line_edit_text_changed(new_text: String) -> void:
	Entsperrcode = %LineEdit.text
	$"Falscher Code eingegeben".visible = false
	$"Falscher Code eingegeben2".visible = false
