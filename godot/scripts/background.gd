extends Sprite2D
var verzoegerung: float

const sharp = preload("res://assets/Instances/ComfyUI_00006_.png")

func _process(delta: float) -> void:
	# Hole die Fenstergröße
	verzoegerung += delta
	if verzoegerung >= 2.0:
		var window_size = get_viewport().get_visible_rect().size

		# Ursprüngliche Texturgrößesa
		var texture_size = texture.get_size()

		# Berechne Skalierungsfaktor für Breite & Höhe
		scale = window_size / texture_size
