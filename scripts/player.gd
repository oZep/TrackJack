extends CharacterBody3D

const WALK_SPEED = 3.0
const SPRINT_SPEED = 5.0
const CURRENT_SPEED = 4.0
const JUMP_VELOCITY = 3.0
const MOUSE_SENSITIVITY = 0.002
const ACCELERATION = 20.0
const DECELERATION = 20.0
const BOB_AMOUNT = 0.1
const BOB_SPEED = 9.5 # its not perfectly in sync with the sounds... but close enough for now :)

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Neck
@onready var camera := $Neck/Camera3D

var bob_offset = 0.0 # just store the offset, to make things smoother (so we dont have suddent jumps)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			
func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
			camera.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

