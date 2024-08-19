extends Control

func _on_start_button_pressed():
	load_next_scene()
	
func load_next_scene():
	LoadingScreen.load_scene("res://levels/level_1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
