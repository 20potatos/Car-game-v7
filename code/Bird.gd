extends Area2D

@export var value: int = 1
@export var score: int = 1

var picked_up = false



func _on_body_entered(body):
	if body.is_in_group("player") && !picked_up:
		$AnimationPlayer.play("pickup")
		$CollisionShape2D.set_deferred("disabled", true)
		get_tree().get_current_scene().add_score(value)
		print(score)
		picked_up = true
		

		


func _on_animation_player_animation_finished(anim_name):
	queue_free()
	

		
