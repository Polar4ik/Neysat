extends Walk

var CROACH_SPEED: float = 1.0


func enter() -> void:
	$"../../NormalCollision".disabled = true
	$"../../CroachCollision".disabled = false
	speed = CROACH_SPEED

func _unhandled_input(_event: InputEvent) -> void:
	input_vec = Input.get_vector("left", "right", "forward", "back")
	
	if Input.is_action_just_released("croach"):
		change.emit(self, "walk")

func update(_delta: float) -> void:
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.0, 0.5)
	if input_vec == Vector2.ZERO:
		change.emit(self, "croach")
