extends Walk

var SPRINT_SPEED: float = 13.0

var stamina: float = 0.0
var MAX_STAMINA: float = 100.0

var stamina_consumption: float = 0.1

func _ready() -> void:
	stamina = MAX_STAMINA

func _unhandled_input(_event: InputEvent) -> void:
	input_vec = Input.get_vector("left", "right", "forward", "back")
	
	if not Input.is_action_pressed("sprint"):
		change.emit(self, "walk")
	
	if Input.is_action_just_pressed("jump"):
		change.emit(self, "jump")
	
	if Input.is_action_just_pressed("crouch"):
		change.emit(self, "slide")

func enter() -> void:
	$"../../NormalCollision".disabled = false
	$"../../CrouchCollision".disabled = true
	
	if stamina == 0.0:
		change.emit(self, "walk")
	
	$StaminaReload.can_reload = false
	$WaitTime.stop()
	
	speed = SPRINT_SPEED

func update(_delta: float) -> void:
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.5, 0.5)
	
	stamina -= stamina_consumption
	stamina = clampf(stamina, 0.0, MAX_STAMINA)
	
	if stamina == 0.0:
		change.emit(self, "walk")
		if $WaitTime.is_stopped():
			$WaitTime.start()

func exit() -> void:
	if stamina < MAX_STAMINA:
		$WaitTime.start()
