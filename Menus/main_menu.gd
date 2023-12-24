extends Control

@onready var exit_btn = $control_buttons/exit_btn
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_btn.connect("pressed", quit)


func quit()->void:
	get_tree().notification(NOTIFICATION_WM_CLOSE_REQUEST, true)
