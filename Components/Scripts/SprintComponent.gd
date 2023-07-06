extends Node

@export var max_stamina := 100.0
var stamina := 0.0

const SPEED := 5.0
const FRICTION := 9.0

func _ready() -> void:
	stamina = max_stamina
	stamina = clamp(stamina, 0, max_stamina)

func sprint(delta) -> void:
	stamina = clamp(stamina, 0, max_stamina)
	if stamina > 0 and Input.is_action_pressed("sprint") and Input.is_action_pressed("forward"):
		$"../WalkComponent".walk(delta, SPEED)
		stamina -= 0.5
		Events.change_stamina.emit(stamina)
	elif stamina < 100 and not Input.is_action_pressed("sprint"):
		stamina += 0.1
		Events.change_stamina.emit(stamina)
