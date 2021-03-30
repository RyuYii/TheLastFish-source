extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	gravity = 1
	pass # Replace with function body.

func _process(delta):
	position.y += gravity


func _on_anillos_body_entered(body):
	get_tree().change_scene("res://tests/lose3.tscn")



