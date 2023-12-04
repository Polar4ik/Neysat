extends BasePlayerState
class_name IdleState

func physics_update(delta: float) -> void:
	if player.velocity != Vector3.ZERO:
		slow(delta)


func slow(delta: float) -> void:
	player.velocity.x = lerpf(player.velocity.x, 0.0, delta * 5.0)
	player.velocity.z = lerpf(player.velocity.z, 0.0, delta * 5.0)
