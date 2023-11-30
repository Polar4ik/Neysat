extends Walk

var CROACH_SPEED: float = 1.0

var not_crouch: bool = false

@export var roof_detecter: RayCast3D

func enter() -> void:
	not_crouch = false
	
	$"../../NormalCollision".disabled = true
	$"../../CrouchCollision".disabled = false
	
	speed = CROACH_SPEED

func _unhandled_input(_event: InputEvent) -> void:
	input_vec = Input.get_vector("left", "right", "forward", "back")
	
	if not Input.is_action_pressed("crouch") and not roof_detecter.is_colliding():
		change.emit(self, "walk")
	
	elif not Input.is_action_pressed("crouch") and roof_detecter.is_colliding():
		not_crouch = true

func update(_delta: float) -> void:
	if not_crouch and not roof_detecter.is_colliding():
		change.emit(self, "walk")
	
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.0, 0.5)
	
	if input_vec == Vector2.ZERO:
		change.emit(self, "crouch")
