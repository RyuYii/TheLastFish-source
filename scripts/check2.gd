extends Area2D


func _ready():
	pass # Replace with function body.


func _on_check_body_entered(body):
	get_tree().change_scene('res://tests/ganar2.tscn')


