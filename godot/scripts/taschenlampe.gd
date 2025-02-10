extends Node3D

func _on_static_body_3d_licht_aus() -> void:
	$SpotLight3D.light_energy = 0
