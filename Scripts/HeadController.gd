extends Node3D

var sensity = 0.1

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * sensity
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)
