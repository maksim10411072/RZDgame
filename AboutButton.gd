extends Button
func _on_AboutButton_pressed():
	get_parent().get_node("WindowDialog").popup_centered()
	get_parent().get_node("WindowDialog").popup()
