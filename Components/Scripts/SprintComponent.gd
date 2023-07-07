extends Node

@export var max_stamina := 100.0
var stamina := 0.0
var can_reset_stamin := false

const SPEED := 10.0

func _ready() -> void:
#	Events.sprint.connect(sprint)
	stamina = max_stamina

func sprint() -> void:
#	print("SPE")
	Events.walk.emit(get_physics_process_delta_time(), SPEED)
