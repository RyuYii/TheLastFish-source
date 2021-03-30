extends Node2D

export (PackedScene) var orca
export (PackedScene) var anillo
export (PackedScene) var pez

var score

func _ready():
	randomize()



func new_game():
	score = 5
	$Nadador.inicio($posicion_inicio.position) #posicion de inicio del jugador
	$timer_inicio.start()
	


func _on_timer_inicio_timeout():
	$timer_orca.start()
	$timer_score.start()
	$timer_anillo.start()
	

func _on_timer_score_timeout():
	var gen = $generador2/gen_orca2
	gen.set_offset(randi())
	var a = pez.instance()
	add_child(a)
	a.position = gen.position

func _on_timer_orca_timeout():
	var gen1 = $generador/gen_orca
	var gen2 = $generador2/gen_orca2
		
	gen1.set_offset(randi())
	var o = orca.instance()
	o.orientacion = 1
	o.flp = true
	add_child(o)
	
	var d = gen1.rotation
	print(d)
	o.position = gen1.position
	
	gen2.set_offset(randi())
	
	var o2 = orca.instance()
	o2.orientacion = -1
	add_child(o2)
	
	var d2 = gen2.rotation
	print(d2)
	o2.position = gen2.position


func _on_timer_anillo_timeout():
	var gen = $generador3/gen_anillos
	gen.set_offset(randi())
	var a = anillo.instance()
	add_child(a)
	a.position = gen.position


func _on_Area2D_area_exited(area):
	area.queue_free()


func _on_Area2D_body_exited(body):
	get_tree().change_scene("res://tests/lose3.tscn")


func _on_Right_pressed():
	pass # Replace with function body.


func _on_Right_released():
	pass # Replace with function body.
