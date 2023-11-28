extends Walk

var SPRINT_SPEED: float = 13.0

var stamina: float = 0.0
var MAX_STAMINA: float = 100.0

var stamina_consumption: float = 0.1

func _ready() -> void:
	stamina = MAX_STAMINA


func enter() -> void:
	if stamina == 0.0:
		change.emit(self, "walk")
	
	$StaminaReload.can_reload = false
	
	speed = SPRINT_SPEED

func update(_delta: float) -> void:
	stamina -= stamina_consumption
	stamina = clampf(stamina, 0.0, MAX_STAMINA)
	
	if stamina == 0.0:
		change.emit(self, "walk")
		if $WaitTime.is_stopped():
			$WaitTime.start()

func exit() -> void:
	if stamina < MAX_STAMINA:
		$WaitTime.start()
