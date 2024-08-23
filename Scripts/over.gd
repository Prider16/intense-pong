extends Control



func _on_play_pressed():
	$Play/Click.play()


func _on_click_finished():
	get_tree().change_scene_to_file("res://Scenes/front.tscn")
