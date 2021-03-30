extends Node2D

const GSPWAN = preload("res://enemies/bloque.tscn")
const FSPWAN = preload("res://enemies/foca.tscn")
const VSPWAN = preload("res://tests/check2.tscn")
const GW = 240
var spawn_position=global_position
onready var player = get_parent().get_node("Nadador")
var cont = 0
var puntos = 0
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawn_position.distance_to(player.global_position) < 600:
		spawn_ground()
		if cont==3:
			spawn_foca()
			puntos+=1
			cont=0
		else:
			cont+=1
	if puntos==10:
		spawn_Victory()
	

func spawn_Victory():
	var spawn_instance = VSPWAN.instance()
	add_child(spawn_instance)
	spawn_instance.global_position.x=spawn_position.x
	spawn_instance.global_position.y=spawn_position.y
	
	randomize()
	spawn_position.x=spawn_position.x + 700
	#spawn_position.y=spawn_position.y + rand_range(-50, 50)
	spawn_position.y=350
	pass

func spawn_ground():
	
	var spawn_instance = GSPWAN.instance()
	add_child(spawn_instance)
	spawn_instance.global_position.x=spawn_position.x
	spawn_instance.global_position.y=spawn_position.y
	
	randomize()
	spawn_position.x=spawn_position.x + rand_range(GW, GW + 50)
	#spawn_position.y=spawn_position.y + rand_range(-50, 50)
	spawn_position.y=rand_range(0, 600 )
	
func spawn_foca():
	var spawn_instance = FSPWAN.instance()
	add_child(spawn_instance)
	spawn_instance.global_position.x=spawn_position.x
	spawn_instance.global_position.y=spawn_position.y
	
	randomize()
	spawn_position.x=spawn_position.x + rand_range(GW, GW + 50)
	#spawn_position.y=spawn_position.y + rand_range(-50, 50)
	spawn_position.y=rand_range(0, 500 )


func _on_VisibilityNotifier2D_screen_exited():
	get_tree().change_scene("res://tests/lose2.tscn")


