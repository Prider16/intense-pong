extends AnimationPlayer


func ReCall(value):
	var Animation_Down = get_animation("Down")
	Animation_Down.track_set_key_value(0,0,value)
	
