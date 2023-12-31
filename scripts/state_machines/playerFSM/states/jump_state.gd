extends PlayerState

func physics_update(delta: float) -> void:
	player.velocity.y = 4.5 * 50 * delta
	change_to.emit("air")
