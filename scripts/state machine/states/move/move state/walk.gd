extends MoveState

@export var WALK_SPEED: float = 6.0


func _unhandled_input(_event: InputEvent) -> void:
	input_vec = Input.get_vector("left", "right", "forward", "back")
	
	if Input.is_action_pressed("sprint"):
		change.emit(self, "sprint")
	
	if Input.is_action_just_pressed("jump"):
		change.emit(self, "jump")
	
	if Input.is_action_pressed("crouch"):
		change.emit(self, "crouchwalk")


func enter() -> void:
	normal_collision_node.disabled = false
	crouch_collision_node.disabled = true
	
	speed = WALK_SPEED


func update(_delta: float) -> void:
	head_lerp(0.5)
	
	if input_vec == Vector2.ZERO:
		change.emit(self, "idle")

func physics_update(delta: float) -> void:
	move(delta)
