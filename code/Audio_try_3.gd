extends VBoxContainer

# script linked to audio box

# Called when the node enters the scene tree for the first time.
func _ready():
	$MasterSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	$MusicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$SFXSlider.value = db_to_linear(AudioServer.get_bus_volume_db(2))
	print("Yeh boi scene!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_sfx_slider_mouse_exited():
	release_focus()

func _on_music_slider_mouse_exited():
	release_focus()

func _on_master_slider_mouse_exited():
	release_focus()
	
func _on_confirm_pressed():
	AudioServer.set_bus_volume_db(0, linear_to_db($MasterSlider.value))
	AudioServer.set_bus_volume_db(1, linear_to_db($MusicSlider.value))
	AudioServer.set_bus_volume_db(2, linear_to_db($SFXSlider.value))
	
	

