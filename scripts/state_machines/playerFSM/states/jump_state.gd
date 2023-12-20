extends PlayerState

func physics_update(delta: float) -> void:
	player.velocity.y += 4.5 * delta * 50
	change_to.emit("air")
