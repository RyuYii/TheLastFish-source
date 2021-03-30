extends StaticBody2D

onready var player = get_parent().get_parent().get_node("Nadador")

func _ready():
	pass # Replace with function body.



func _process(delta):
	if global_position.distance_to(player.global_position) > 1000 and player.global_position.x > global_position.x:
		queue_free()
	
	pass
