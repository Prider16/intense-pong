extends CharacterBody2D


@export var gravity = 900.0
@export var jump_force: int = -500

var max_speed = 300

var is_started = false
var should_process_input = true

func _ready():
	velocity = Vector2.ZERO
func jump():
		velocity.y = jump_force

func _physics_process(delta):
	if Input.is_action_pressed("Up") && should_process_input:
		if !is_started: 
			is_started = true
		jump()
		
	if !is_started:
		return
	velocity.y += gravity * delta
	
	if velocity.y > max_speed:
		velocity.y = max_speed
	
	move_and_slide()
