extends CharacterBody3D

const SPEED = 1
const DISTANCE_TO_WARNING = 15
const DISTANCE_TO_JUMPSCARE = 3
const BOBBING_SPEED = 1.5
const BOBBING_AMPLITUDE = 0.005

@onready var player = get_node("../Player")

var last_played = "" # to prevent from the same sfx being overly played

func _ready():
	pass

func _physics_process(delta):
	var player_position = player.global_transform.origin
	var distance_to_player = (player_position - global_transform.origin).length()
	var direction_to_target = (player_position - global_transform.origin).normalized()
	direction_to_target.y = 0
