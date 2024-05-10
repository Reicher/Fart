extends CanvasLayer

signal game_over(reason)
signal win

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("exit"):
		get_tree().quit()

func _on_player_health_changed(health):
	# Update the health bar based on the new health value
	$healthbar.value = health
	
	if health == 0:
		emit_signal("game_over", "You died!")
		
func _on_goal_body_entered(body):
	if body.name == "Player":
		emit_signal("win")

func _on_timer_game_over(reason):
	emit_signal("game_over", "Timer ran out!")
