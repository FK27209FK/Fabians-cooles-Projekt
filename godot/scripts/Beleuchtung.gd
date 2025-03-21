extends SpotLight3D

func _ready() -> void:
	Global.connect("BeleuchtungsfarbeAendern",_on_BeleuchtungsfarbeAendern)

func _on_BeleuchtungsfarbeAendern():
	self.light_color = Color(1,1,1)
	while self.light_energy < 2:
		await get_tree().create_timer(0.05).timeout #Warte 0.05 Sekunden
		self.light_energy = self.light_energy + 0.1
