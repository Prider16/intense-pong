extends Node2D

var score = 0
var Value : int = 0
var Highest_score : int = 0
const PADDLE_SPEED : int = 500
var out = false
var UP_BAR = false
var spot = Vector2()

func _process(delta):
	if out == false:
		score += 10*delta
		Value = int(score)
		$UI/Score.text = str(Value)
	elif out == true:
		if Value > Highest_score:
			Highest_score = Value
			$UI/High_Score.text = str(Highest_score)
			score = 0
			out = false
		else:
			score = 0
			out = false
		
	

func _on_ball_timmer_timeout():
	$Ball.new_ball()


func _on_left_out_body_entered(body):
	out = true
	$BallTimmer.start()


func _on_right_out_body_entered(body):
	out = true
	$BallTimmer.start()
