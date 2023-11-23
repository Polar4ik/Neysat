extends Walk

var SPRINT_SPEED: float = 10.0

func _ready() -> void:
	EI.sprint_input.connect(func(iv): input_vec = iv)
	EI.jump.connect(func(): change.emit(self, "jump"))

func enter() -> void:
	speed = SPRINT_SPEED
