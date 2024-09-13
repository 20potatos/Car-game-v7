extends Node2D

var coins_collected = 0 
var score_collected = 0 

func add_score(amount):
	score_collected += amount
	$Bird_UI/Bird/Label.text = str(score_collected)
	if score_collected == 3:
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/keyboard_warrior.tscn")
		
		

func add_coins(amount):
	coins_collected += amount 
	$UI/coin/Label.text = str(coins_collected)
	if coins_collected == 100:
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/finish_screen.tscn")
		
		#get_tree().change_scene_to_file("res://scenes/finish_screen.tscn")
	
func update_fuel_UI(value):
	$UI/Fuel/ProgressBar.value = value 
	var stylebox = $UI/Fuel/ProgressBar.get("custom_styles/fg")
	if value == 0:
		$UI/Fuel/AnimationPlayer.play("Alarm")
	else:
		$UI/Fuel/AnimationPlayer.play("Idle")
	
