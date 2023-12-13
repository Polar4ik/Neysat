extends Marker3D

var sensity := 0.1
@export var player: CharacterBody3D
@export var camera: Camera3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	EventManager.head_mouse_rotation.connect(head_rotation)

func head_rotation(vector: Vector2) -> void:
	player.rotation_degrees.y += -vector.x * sensity
	
	camera.rotation_degrees.x += -vector.y * sensity
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90.0, 90.0)
