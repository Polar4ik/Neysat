extends BasePlayerState
class_name MoveState

var speed: float
var direction: Vector3

var lerp_acceleration: float = 4.0

func move(delta: float) -> void:
	direction = (player.transform.basis * Vector3(input_vec.x, 0, input_vec.y)).normalized()
	
	player.velocity.x = lerpf(player.velocity.x, speed * direction.x, delta * lerp_acceleration)
	player.velocity.z = lerpf(player.velocity.z, speed * direction.z, delta * lerp_acceleration)
