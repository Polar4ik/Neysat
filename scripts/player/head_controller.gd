extends Marker3D

@onready var player: CharacterBody3D = $".."

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		player.rotation_degrees.y += rad_to_deg(-event.relative.x * 0.003)
		
		rotation_degrees.x += rad_to_deg(-event.relative.y * 0.003)
		rotation_degrees.x = clamp(rotation_degrees.x, -90.0, 90.0)

