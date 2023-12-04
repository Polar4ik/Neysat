extends BasePlayerState

const GRAVITY = 9.8

func physics_update(delta) -> void:
	if !player.is_on_floor():
		player.velocity.y -= GRAVITY * delta
	else:
		change.emit(self, "idle")
