extends Node

@onready var head: Marker3D = $"../Head"
@onready var player: CharacterBody3D = $".."

var sensity: float = 0.005

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	var input_vec: Vector2 = Input.get_vector("left", "right", "forward", "back")
	
	DI.input_velocity = input_vec

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_head(event)
	
	if Input.get_vector("left", "right", "forward", "back") and not Input.is_action_pressed("sprint"):
		input_move("move_input")
	else:
		EI.move_input.emit(Vector2.ZERO)
	
	if Input.get_vector("left", "right", "forward", "back") and Input.is_action_pressed("sprint"):
		input_move("sprint_input")
	else:
		EI.sprint_input.emit(Vector2.ZERO)
	
	if Input.is_action_just_pressed("jump"):
		EI.jump.emit()
	
	

func rotation_head(event: InputEventMouseMotion) -> void:
	player.rotation.y += -event.relative.x * sensity
	
	head.rotation.x += -event.relative.y * sensity
	head.rotation_degrees.x = clamp(head.rotation_degrees.x, -90, 90)

func input_move(signal_name: String) -> void:
	var input_vec: Vector2 = Input.get_vector("left", "right", "forward", "back")
	
#	EI.move_input.emit(input_vec)
	EI.emit_signal(signal_name, input_vec)

