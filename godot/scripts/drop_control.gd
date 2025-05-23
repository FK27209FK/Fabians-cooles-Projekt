extends Control

func _ready() -> void:
	Global.connect("DropVisible",Drop)

func Drop():
	$".".visible = !$".".visible
