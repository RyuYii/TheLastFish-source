extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://tests/lose.tscn")


func _on_Bandera_body_entered(body):
	get_tree().change_scene('res://tests/ganar.tscn')


