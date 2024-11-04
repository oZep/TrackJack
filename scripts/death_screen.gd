extends Control

func _ready():
	var msec = fmod(Global.time, 1) * 100
	var seconds = fmod(Global.time, 60)
	var minutes = fmod(Global.time, 3600) / 60
	$TimerLayer/Panel/Minutes.text = "%02d:" % minutes
	$TimerLayer/Panel/Seconds.text = "%02d." % seconds
	$TimerLayer/Panel/Miliseconds.text = "%03d" % msec

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
