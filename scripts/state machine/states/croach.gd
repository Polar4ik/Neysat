extends Idle

var not_crouch: bool = false

@export var roof_detecter: RayCast3D

func enter() -> void:
	not_crouch = false
	
	$"../../NormalCollision".disabled = true
	$"../../CrouchCollision".disabled = false

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_released("crouch") and not roof_detecter.is_colliding():
		change.emit(self, "idle")
	elif not Input.is_action_pressed("crouch") and roof_detecter.is_colliding():
		not_crouch = true
	
	var input_vec: Vector2 = Input.get_vector("left", "right", "forward", "back")
	
	if input_vec:
		change.emit(self, "crouchwalk")
	

func update(_delta: float) -> void:
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.0, 0.5)
	
	if not_crouch and not roof_detecter.is_colliding():
		change.emit(self, "idle")

