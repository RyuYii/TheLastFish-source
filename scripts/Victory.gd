extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var a = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$label.bbcode_text = ''
	pass # Replace with function body.



func _process(delta):
	if a:
		$label.bbcode_text = 'VICTORY!!!'
		$label.percent_visible = 0
		$Tween.interpolate_property(
			$label, 'percent_visible', 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		a = false

