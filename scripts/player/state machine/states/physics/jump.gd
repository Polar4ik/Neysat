extends BasePlayerState

var JUMP_FORCE: float = 4.5

@export var roof_detecter: RayCast3D

func physics_update(_delta: float) -> void:
	if player.is_on_floor() and not roof_detecter.is_colliding():
		player.velocity.y = 4.5
		change.emit(self, "onair")
	elif roof_detecter.is_colliding():
		change.emit(self, "idle")
