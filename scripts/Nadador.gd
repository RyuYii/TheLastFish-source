extends KinematicBody2D

const ACCELERATION = 20
const MAX_SPEED = 100
const JUMP_H = -100
const UP = Vector2(0, -1)
const gravity = 2

onready var sprite = $spr_nadador
onready var animationPlayer = $anim_nadador

var motion = Vector2()
signal golpe

#touch
var tL = false
var tR = false
var tJ = false

func _physics_process(delta):
	# apply gravity to the player
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right") or tR:
		sprite.flip_h = true
		#animationPlayer.play("walk")
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left") or tL:
		#animationPlayer.play("walk")
		sprite.flip_h = false
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	elif Input.is_action_just_pressed("ui_accept") or tJ:
		motion.y = JUMP_H
	else:
		animationPlayer.play("idle")
		friction = true
			
	motion = move_and_slide(motion, UP)
	
func inicio(pos):
	position = pos
	show() 


func _on_Left_pressed():
	tL = true


func _on_Left_released():
	tL = false


func _on_Right_pressed():
	tR = true


func _on_Right_released():
	tR = false


func _on_Jump_pressed():
	tJ = true


func _on_Jump_released():
	tJ = false
