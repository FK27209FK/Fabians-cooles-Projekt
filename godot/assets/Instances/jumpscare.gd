extends Node3D

var wasJumpscared: bool = false;
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var jumpscareImage: Sprite2D = $"Artworks-tdOaaXxz26uFxLis-uefmWw-t500x500"


func _on_area_3d_body_entered(body: Node3D) -> void:
	if (wasJumpscared): 
		return
	
	audio_stream_player_3d.play()
	jumpscareImage.visible = true
	wasJumpscared = true;

func _on_audio_stream_player_3d_finished() -> void:
	jumpscareImage.visible = false
	pass
