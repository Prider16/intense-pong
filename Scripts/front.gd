extends Control


func _on_play_pressed():
	$Play/Click.play()


func _on_how_to_pressed():
	$How_to/Click2.play()


func _on_click_finished():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")



func _on_click_2_finished():
	get_tree().change_scene_to_file("res://Scenes/how_to.tscn")


func _on_exit_pressed():
	get_tree().quit()
