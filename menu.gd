extends Control

@onready var transition = $Transition

func _ready():
	transition.play("fade_in")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("space"):
		transition.play("fade_out")


func _on_transition_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene_to_file("res://main.tscn")
