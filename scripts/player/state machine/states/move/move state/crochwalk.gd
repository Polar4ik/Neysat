extends MoveState

var CROACH_SPEED: float = 1.0

var not_crouch: bool = false

@export var roof_detecter: RayCast3D

func enter() -> void:
	not_crouch = false
	
	normal_collision_node.disabled = true
	crouch_collision_node.disabled = false
	
	speed = CROACH_SPEED

func _unhandled_input(_event: InputEvent) -> void:
	input_vec = Input.get_vector("left", "right", "forward", "back")
	
	if not Input.is_action_pressed("crouch") and not roof_detecter.is_colliding():
		change.emit(self, "walk")
	
	elif not Input.is_action_pressed("crouch") and roof_detecter.is_colliding():
		not_crouch = true

func update(_delta: float) -> void:
	head_node.position.y = lerpf(head_node.position.y, 0.0, 0.5)
	
	if not_crouch and not roof_detecter.is_colliding():
		change.emit(self, "walk")
	
	if input_vec == Vector2.ZERO:
		change.emit(self, "crouch")

func physics_update(delta) -> void:
	move(delta)
