class_name Player extends CharacterBody3D

@onready var camera: Camera3D = $Camera
@onready var respawnTimer: Timer = $RespawnTimer
@onready var reaktorTimer: Timer = $UI/ReaktorTimer
@onready var reaktorTimerText: RichTextLabel = $UI/ReaktorTimerText
@export_category("Player")
@export_range(1, 35, 1) var speed: float = 10 # m/s
@export_range(10, 400, 1) var acceleration: float = 100 # m/s^2
@export_range(0.1, 3.0, 0.1) var jump_height: float = 3 # m
@export_range(0.1, 3.0, 0.1, "or_greater") var camera_sens: float = 1
@export var spruchListeTod: Array[String] = [
	"Oh, das hat wohl nicht ganz geklappt... bis zum nächsten Mal!",
	"Tja, das war's für dich. Schade um den Mut!",
	"Der Raum hat entschieden, dass du nicht weiterkommst. Willkommen in der Dunkelheit!",
	"Das war ein schneller Abgang! Vielleicht beim nächsten Versuch?",
	"Ein weiterer gescheiterter Versuch. Vielleicht warst du einfach nicht clever genug?",
	"Oops! Das war der falsche Schalter. Besser nächstes Mal aufpassen!",
	"Und wieder hat der Raum einen gewonnen. So nah und doch so weit!",
	"Manchmal ist es besser, nicht aufzugeben. Aber hier... naja, zu spät!",
	"Ein weiterer Hinweis, den du übersehen hast! Schade!",
	"Der Raum hat gesprochen. Vielleicht solltest du es einfach lassen?",
]

# Total time in seconds (1 hour = 3600 seconds)
var total_time: int = 3600
var playerIsAlive: bool = true
var jumping: bool = false
var mouse_captured: bool = false
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var move_dir: Vector2 # Input direction for movement
var look_dir: Vector2 # Input direction for look/aim
var walk_vel: Vector3 # Walking velocity 
var grav_vel: Vector3 # Gravity velocity 
var jump_vel: Vector3 # Jumping velocity
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	reaktorTimerText.text = format_time(total_time)
	capture_mouse()

func _process(_delta: float) -> void:
	@warning_ignore("narrowing_conversion")
	reaktorTimerText.text = format_time(reaktorTimer.time_left)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		look_dir = event.relative * 0.001
		if mouse_captured: _rotate_camera()
	if Input.is_action_just_pressed("jump"): jumping = true
	if Input.is_action_just_pressed("exit"): get_tree().quit()

func _physics_process(delta: float) -> void:
	#if mouse_captured: _handle_joypad_camera_rotation(delta)
	if playerIsAlive == true:
		velocity = _walk(delta) + _gravity(delta) + _jump(delta)
		move_and_slide()

func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true

func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false

func _rotate_camera(sens_mod: float = 1.0) -> void:
	if playerIsAlive == true:
		camera.rotation.y -= look_dir.x * camera_sens * sens_mod
		camera.rotation.x = clamp(camera.rotation.x - look_dir.y * camera_sens * sens_mod, -1.5, 1.5)

#func _handle_joypad_camera_rotation(delta: float, sens_mod: float = 1.0) -> void:
	#var joypad_dir: Vector2 = Input.get_vector("look_left","look_right","look_up","look_down")
	#if joypad_dir.length() > 0:
		#look_dir += joypad_dir * delta
		#_rotate_camera(sens_mod)
		#look_dir = Vector2.ZERO

func _walk(delta: float):
	if playerIsAlive == true:
		vis_false()
		move_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		var sprint = Input.is_key_pressed(KEY_CTRL)
		var sprintspeed: float = 1
		#print(sprint)
		if sprint == true:
			sprintspeed = 1.5
		var _forward: Vector3 = camera.global_transform.basis * Vector3(move_dir.x, 0, move_dir.y)
		var walk_dir: Vector3 = Vector3(_forward.x, 0, _forward.z).normalized()
		walk_vel = walk_vel.move_toward(walk_dir * speed * sprintspeed * move_dir.length(), acceleration * delta)
		return walk_vel
	else:
		print("ERROR: player is not alive")
func _gravity(delta: float) -> Vector3:
	grav_vel = Vector3.ZERO if is_on_floor() else grav_vel.move_toward(Vector3(0, velocity.y - gravity, 0), gravity * delta)
	return grav_vel

func _jump(delta: float) -> Vector3:
	vis_false()
	if jumping:
		if is_on_floor(): jump_vel = Vector3(0, sqrt(4 * jump_height * gravity), 0)
		jumping = false
		return jump_vel
	jump_vel = Vector3.ZERO if is_on_floor() else jump_vel.move_toward(Vector3.ZERO, gravity * delta)
	return jump_vel
	
func vis_true():
	$Camera/Interact/InteractControl.visible = true

func vis_false():
	$Camera/Interact/InteractControl.visible = false

func zufallTodSpruch():
	var random = rng.randi_range(0,len(spruchListeTod) - 1)
	print("Random index:", random)

	#TODO! Wenn audio (Sprüche bei TOD | #25) fertig:
	# Construct the path as a string using concatenation
	#var audio_path = "../Sprüche bei Tod/" + str(random)
	#var audio_node = get_node(audio_path)

	# Check if the audio node exists before playing it
	#if audio_node:
		#audio_node.play()
	#else:
		#print("Audio node not found: " + audio_path)

	return spruchListeTod[random]


func game_over():
	playerIsAlive = false
	$"Game Over".show()
	$"Game Over/spruch".text =  zufallTodSpruch() 
	respawnTimer.start(5)
	while respawnTimer.is_stopped() == false:
		$"Game Over/Respawn in ___".text = "Respawn in " + str(int(respawnTimer.time_left))
		await get_tree().create_timer(0.5).timeout
	
func _on_area_3d_area_entered(area: Area3D) -> void:
	if area == $"../Area3D":
		game_over()

func respawn():
	get_tree().reload_current_scene()
	$"Game Over".hide()
	
func _on_timer_timeout() -> void:
	respawn()

func format_time(seconds: int) -> String:
	@warning_ignore("integer_division")
	var hours = seconds / 3600
	@warning_ignore("integer_division")
	var minutes = (seconds % 3600) / 60
	var secs = seconds % 60
	return "%02d:%02d:%02d" % [hours, minutes, secs]
	
func _on_timer_2_timeout():
	if total_time > 0:
		total_time -= 1
		reaktorTimerText.text = format_time(total_time)
	else:
		# Stop the timer when time reaches 0
		$Timer2.stop()

func _on_aufzug_body_entered(body: Player) -> void:
	if $"../Räume/Raum 2/Schalter 1/Schalter_Hebel/StaticBody3D".switchActive && body.position.y < 5.5:
		body.gravity = 0
		var target_position_y = body.position.y + 5.5 
		var tween = create_tween()
		tween.tween_property(body, "position:y", target_position_y, 1.0).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

func _on_aufzug_body_exited(body: Player) -> void:
	body.gravity = 9.8
