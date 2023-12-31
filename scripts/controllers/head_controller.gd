extends Marker3D

var sensity := 0.1
@export var player: CharacterBody3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	EventManager.head_mouse_rotation.connect(head_rotation)

func head_rotation(vector: Vector2) -> void:
	player.rotation_degrees.y += -vector.x * sensity
	
	rotation_degrees.x += -vector.y * sensity
	rotation_degrees.x = clamp(rotation_degrees.x, -90.0, 90.0)

func _process(_delta: float) -> void:
	head_rotate_z()

func head_rotate_z() -> void:
	var side := -Input.get_axis("left", "right")
	rotation_degrees.z = lerp(rotation_degrees.z, side * abs(player.velocity.x), .1)
