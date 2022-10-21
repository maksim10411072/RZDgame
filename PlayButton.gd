extends Button
var game = preload("res://Node2D.tscn")
func _on_PlayButton_pressed():
	get_tree().change_scene_to(game)
