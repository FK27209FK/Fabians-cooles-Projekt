extends Node3D

func _on_node_3d_tuer_oeffnen() -> void:
	$Wand4/Tuer1/AnimationPlayer.play("oeffnen")

func _ready() -> void:
	Global.connect("TuerOeffnen", _on_node_3d_tuer_oeffnen)
