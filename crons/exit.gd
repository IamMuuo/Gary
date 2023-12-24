extends Node


var dialog = ConfirmationDialog.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_last_exclusive_window().get_size_with_decorations())
	dialog.position.x = (get_last_exclusive_window().get_size_with_decorations().x / 2) - 100
	dialog.position.y = (get_last_exclusive_window().get_size_with_decorations().y / 2) - 50
	dialog.dialog_text = "Are you sure you want to quit?"
	dialog.get_ok_button().text = "Sure"
	dialog.get_cancel_button().text = "Cancel"
	dialog.connect("confirmed", end)
	add_child(dialog)
	
func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		dialog.popup()

# Cleanly terminates the game
func end() -> void:
	get_tree().quit()
