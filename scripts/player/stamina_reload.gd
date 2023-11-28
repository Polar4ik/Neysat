extends Node

@onready var sprint: Node = $".."

var can_reload: bool = false

func _on_wait_time_timeout() -> void:
	can_reload = true

func _process(_delta: float) -> void:
	if can_reload:
		sprint.stamina += 0.1
		sprint.stamina = clampf(sprint.stamina, 0.0, sprint.MAX_STAMINA)
	
	if sprint.stamina == sprint.MAX_STAMINA:
		can_reload = false
