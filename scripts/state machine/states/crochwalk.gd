extends Walk

var CROACH_SPEED: float = 1.0

var not_croach: bool = false

func enter() -> void:
	not_croach = false
	
	$"../../NormalCollision".disabled = true
	$"../../CroachCollision".disabled = false
	
	speed = CROACH_SPEED

func _unhandled_input(_event: InputEvent) -> void:
	input_vec = Input.get_vector("left", "right", "forward", "back")
	
	if not Input.is_action_pressed("croach") and not $"../../Head/RoofDetecter".is_colliding():
		change.emit(self, "walk")
	
	elif not Input.is_action_pressed("croach") and $"../../Head/RoofDetecter".is_colliding():
		not_croach = true

func update(_delta: float) -> void:
	if not_croach and not $"../../Head/RoofDetecter".is_colliding():
		change.emit(self, "walk")
	
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.0, 0.5)
	
	if input_vec == Vector2.ZERO:
		change.emit(self, "croach")
