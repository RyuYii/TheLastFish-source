extends KinematicBody2D

const ACCELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -600
const UP = Vector2(0, -1)
const gravity = 40

onready var sprite = $spr_pingui
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

#touch 

var touchR = false
var touchL = false
var touchJ = false

func _physics_process(delta):
	# apply gravity to the player
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right") or touchR:
		sprite.flip_h = true
		animationPlayer.play("walk")
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left") or touchL:
		animationPlayer.play("walk")
		sprite.flip_h = false
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		animationPlayer.play("idle")
		friction = true
		
	if is_on_floor():
		
		if Input.is_action_just_pressed("ui_accept") or touchJ:
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
			
	motion = move_and_slide(motion, UP)
	


func _on_TouchScreenButton_pressed():
	touchR = true


func _on_TouchScreenButton_released():
	touchR = false


func _on_left_pressed():
	touchL = true


func _on_jump_released():
	touchJ = false


func _on_left_released():
	touchL = false


func _on_jump_pressed():
	touchJ = true
