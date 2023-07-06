extends Node3D

var sensity = 0.1

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * sensity
		rotation_degrees.x -= event.relative.y * sensity
