extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Menu_pressed():
	get_tree().change_scene("res://tests/Menu.tscn")


func _on_Return_pressed():
	get_tree().change_scene("res://tests/mundo.tscn")


func _on_Return2_pressed():
	get_tree().change_scene("res://tests/nivel2.tscn")


func _on_Return3_pressed():
	get_tree().change_scene("res://tests/nivel3.tscn")
