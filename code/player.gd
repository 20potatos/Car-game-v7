extends RigidBody2D

var wheels = []
var speed = 75000
var max_speed = 55
var fuel = 100
var dead = false
var driving = 0


func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")
	get_parent().update_fuel_UI(fuel)
	
func _physics_process(delta):
	
	driving = 0
	
	if fuel > 0 && !dead:
		$GameOverTimer.stop()
		if Input.is_action_pressed("ui_right"): 
			driving += 1 
			apply_torque_impulse(-4000 * delta * 60)
			for wheel in wheels:
				if wheel.angular_velocity < max_speed:
					wheel.apply_torque_impulse(speed * delta * 60)
					

		if Input.is_action_pressed("ui_left"): 
			driving += 1 
			apply_torque_impulse(8000 * delta * 60)
			for wheel in wheels:
				if wheel.angular_velocity > -max_speed:
					wheel.apply_torque_impulse(-speed * delta * 60)
					
	else:
		if $GameOverTimer.is_stopped():
			$GameOverTimer.start()
					
	if $Head.rotation_degrees > 90 || $Head.rotation_degrees < -90 && !dead:
		dead = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/tiltle_screen.tscn")
		$Head/HeadSpring.node_b = ""
		
	if driving == 1:
		$EngineSFX.pitch_scale = lerpf($EngineSFX.pitch_scale, 2, 2 * delta)
		use_fuel(delta)
	else:
		$EngineSFX.pitch_scale = lerpf($EngineSFX.pitch_scale, 1, 2 * delta)
func refuel():
	fuel = 100 
	get_parent().update_fuel_UI(fuel)
	
func use_fuel(delta):
	fuel -= 10 * delta 
	fuel = clamp(fuel, 0, 100)
	get_parent().update_fuel_UI(fuel)
	

		
	


func _on_game_over_timer_timeout():
	#Game Over 
	get_tree().change_scene_to_file("res://scenes/tiltle_screen.tscn")
	
