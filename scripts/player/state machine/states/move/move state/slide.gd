extends MoveState

@export var roof_detecter: RayCast3D

func enter() -> void:
	normal_collision_node.disabled = true
	crouch_collision_node.disabled = false

func update(_delta: float) -> void:
	head_lerp(0.0)
	
	
	if floor(abs(player.velocity.x)) < 2.0 and floor(abs(player.velocity.z)) < 2.0:
		if roof_detecter.is_colliding():
			change.emit(self, "crouch")
		else:
			change.emit(self, "idle")


func physics_update(delta: float) -> void:
	slide(delta)


func slide(delta: float) -> void:
	player.velocity.z = lerp(player.velocity.z, 0.0, delta * 0.9)
	player.velocity.x = lerp(player.velocity.x, 0.0, delta * 0.9)
