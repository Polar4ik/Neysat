extends Node

var walk_vector: Vector2

func _unhandled_input(event: InputEvent) -> void:
	head_input(event)
	
	walk_input()
	jump_input()
	
	shoot_input()
	



func walk_input() -> void:
	var input_vec := Input.get_vector("left", "right", "forward", "back")
	
	walk_vector = input_vec
	
	if input_vec:
		EventManager.walk_pressed.emit(true)
		EventManager.walk_input.emit(input_vec)
	elif input_vec == Vector2.ZERO:
		EventManager.walk_pressed.emit(false)


func head_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		EventManager.head_mouse_rotation.emit(event.relative)


func shoot_input() -> void:
	if Input.is_action_just_pressed("shoot"):
		EventManager.shoot.emit()

func jump_input() -> void:
	if Input.is_action_just_pressed("jump"):
		EventManager.jump.emit()
