extends Control



func _on_back_pressed():
	$Click.play()


func _on_click_finished():
	get_tree().change_scene_to_file("res://Scenes/front.tscn")
