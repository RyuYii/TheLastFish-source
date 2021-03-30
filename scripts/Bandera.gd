extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Bandera_body_entered(body):
	get_tree().change_scene('res://tests/ganar.tscn')
