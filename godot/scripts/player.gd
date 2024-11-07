class_name Player extends CharacterBody3D

@onready var camera: Camera3D = $Camera
@onready var timer: Timer = $Timer
@export_category("Player")
@export_range(1, 35, 1) var speed: float = 10 # m/s
@export_range(10, 400, 1) var acceleration: float = 100 # m/s^2
@export_range(0.1, 3.0, 0.1) var jump_height: float = 3 # m
@export_range(0.1, 3.0, 0.1, "or_greater") var camera_sens: float = 1
@export var spruchListe = ["hallo","test","123"]
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
	capture_mouse()

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
	$Camera3D/RayCast3D/Control/Label.visible = true

func vis_false():
	$Camera3D/RayCast3D/Control/Label.visible = false

func zufallTodSpruch():
	var random = rng.randi_range(0,len(spruchListe) - 1)
	return spruchListe[random]

func game_over():
	playerIsAlive = false
	$"Game Over".show()
	$"Game Over/spruch".text =  zufallTodSpruch() 
	timer.start(5)
	while timer.is_stopped() == false:
		$"Game Over/Label2".text = "Respawn in " + str(int(timer.time_left))
		await get_tree().create_timer(0.5).timeout
	
func _on_area_3d_area_entered(area: Area3D) -> void:
	if area == $"../Area3D":
		game_over()

func respawn():
	get_tree().reload_current_scene()
	$"Game Over".hide()
	
func _on_timer_timeout() -> void:
	respawn()
