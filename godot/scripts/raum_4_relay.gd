extends Node3D
var lights = [%SpotLight3D,%SpotLight3D2,%SpotLight3D3,%SpotLight3D4,%SpotLight3D5,%SpotLight3D6,%SpotLight3D7,%SpotLight3D8,%SpotLight3D9,%SpotLight3D10,%SpotLight3D11]

func _on_sicherungskasten_2_licht_an() -> void:
	for light in lights:
		light.light_color = Color(1,1,1) #Farbe zu weiß ändern
		$"../SpotLight3D/LichtAus".visible = false
		$"../SpotLight3D/LichtAn".visible = true
		while light.light_energy < 2:
			await get_tree().create_timer(0.05).timeout #Warte 0.05 Sekunden
			light.light_energy = light.light_energy + 0.1 
