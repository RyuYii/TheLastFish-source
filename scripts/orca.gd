extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var orientacion = 0
onready var sprite = $spr_orca
var flp = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$anim_orca.play("Idle")
	gravity = orientacion
	if flp:
		sprite.flip_h = true


func _physics_process(delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += gravity


func _on_orca_body_entered(body):
	get_tree().change_scene("res://tests/lose3.tscn")


