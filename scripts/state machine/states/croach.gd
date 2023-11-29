extends Idle

var not_croach: bool = false

func enter() -> void:
	not_croach = false
	
	$"../../NormalCollision".disabled = true
	$"../../CroachCollision".disabled = false

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_released("croach") and not $"../../Head/RoofDetecter".is_colliding():
		change.emit(self, "idle")
	elif not Input.is_action_pressed("croach") and $"../../Head/RoofDetecter".is_colliding():
		not_croach = true
	
	
	var input_vec: Vector2 = Input.get_vector("left", "right", "forward", "back")
	
	if input_vec:
		change.emit(self, "croachwalk")
	

func update(_delta: float) -> void:
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.0, 0.5)
	
	if not_croach and not $"../../Head/RoofDetecter".is_colliding():
		change.emit(self, "idle")

