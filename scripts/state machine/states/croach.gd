extends Idle

func enter() -> void:
	$"../../NormalCollision".disabled = true
	$"../../CroachCollision".disabled = false

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_released("croach"):
		change.emit(self, "idle")
	
	var input_vec: Vector2 = Input.get_vector("left", "right", "forward", "back")
	
	if input_vec:
		change.emit(self, "croachwalk")
	

func update(_delta: float) -> void:
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.0, 0.5)

