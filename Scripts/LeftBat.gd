extends StaticBody2D

var win_height : int
var p_height : int
var UP_BAR = false
var spot = Vector2()
@onready var left_player = $LeftPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = $"../ColorRect".size.y
	p_height = $LeftColour.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Up"):
		UP_BAR = true
		if UP_BAR != false:
			position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_just_released("Up"):
		UP_BAR = false
		if UP_BAR == false:
			if position.y != 572:
				spot =position
				left_player.ReCall(spot)
				left_player.play("Down")
				if position.y == 572:
					left_player.stop()

	position.y = clampf(position.y, p_height / 2, win_height - p_height/2)
