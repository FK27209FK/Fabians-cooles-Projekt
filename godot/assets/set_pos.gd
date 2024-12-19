extends Node3D

func _on_aufzug_body_entered(body: Node3D) -> void:
	if $"../../Schalter 1/Schalter_Hebel/StaticBody3D".switchActive:
		$AnimationPlayer2.play("aufzug_2")
