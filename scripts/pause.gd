extends Control

@onready var pause_menu := $VSplitContainer

func _ready():
	pause_menu.hide()

func _input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			unpause()
		else:
			pause()

func pause():
	get_tree().paused = true
	pause_menu.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func unpause():
	get_tree().paused = false
	pause_menu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_continue_pressed():
	unpause()

func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
