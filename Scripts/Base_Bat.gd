extends CharacterBody2D
class_name Bat

@export var gravity = 900.0
@export var jump_force: int = -400

var max_speed = 300
var height

var is_started = false
var should_process_input = true

func _ready():
	velocity = Vector2.ZERO
	velocity.x = 0
func jump():
		velocity.y = jump_force

func Movement(delta,Inp : String):
	velocity.x = 0
	if Input.is_action_pressed(Inp) && should_process_input:
		if !is_started: 
			is_started = true
		jump()
		
	if !is_started:
		return
	velocity.y += gravity * delta
	
	if velocity.y > max_speed:
		velocity.y = max_speed
	
	move_and_slide()
