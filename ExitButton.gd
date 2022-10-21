extends Button
func _on_ExitButton_pressed():
	get_parent().get_node("ExitConfirm").popup()
