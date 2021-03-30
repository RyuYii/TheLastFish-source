extends KinematicBody2D
export (int) var Velocidad
var Movimiento = Vector2()	#variable para la posicion
var limite
# Called when the node enters the scene tree for the first time.
func _ready():
	#limite = get_viewport_rect()
	$spr_player.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movimiento = Vector2()
	#Movimiento.y = 400
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
	
	position += Movimiento * delta
	#print(Movimiento.x)
	if Movimiento.x != 0:
		$spr_player.animation = 'caminar'
		$spr_player.flip_h = Movimiento.x > 0
	else:
		$spr_player.animation = 'quieto'
