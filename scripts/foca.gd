extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animationPlayer = $animation_foca
onready var player = get_parent().get_parent().get_node("Nadador")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animationPlayer.play("Idle")
	if global_position.distance_to(player.global_position) > 1000 and player.global_position.x > global_position.x:
		queue_free()


func _on_foca_body_entered(body):
	get_tree().change_scene("res://tests/lose2.tscn")
