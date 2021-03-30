extends Area2D

func _ready():
	gravity = 1

func _process(delta):
	position.x -= gravity

func _on_nofify_pez_screen_exited():
	queue_free()

func _on_pez_body_entered(body):
	get_tree().change_scene("res://tests/ganar3.tscn")


