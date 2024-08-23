extends CharacterBody2D

const START_SPEED : int = 400
const ACCEL : int = 25
var speed : int
var dir : Vector2
const MAX_Y_VECTOR : float = 0.6
@onready var bat_hit = $"../Bat hit"
@onready var ball_hit = $"../Ball hit"

	
func new_ball():
	#randomize start position and direction
	position.x = 576
	position.y = 300
	speed = START_SPEED
	dir = random_direction()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		#if ball hits paddle
		if collider == $"../LeftBat" or collider == $"../RightBat":
			bat_hit.play()
			dir = new_direction(collider)
			speed += ACCEL
			#dir = new_direction(collider)
		#if it hits a wall
		else:
			ball_hit.play()
			dir = dir.bounce(collision.get_normal())

func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()

func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	#flip the horizontal direction
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist / (159)/2) * MAX_Y_VECTOR
	return new_dir.normalized()
