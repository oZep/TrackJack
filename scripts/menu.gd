extends Node

@onready var survival_mode = $SurvivalMode
@onready var easy_mode = $EasyMode
@onready var normal_mode = $NormalMode

func _ready():
	pass

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

