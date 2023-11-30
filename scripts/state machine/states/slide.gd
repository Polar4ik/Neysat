extends State

@onready var player: CharacterBody3D = $"../.."
@export var roof_detecter: RayCast3D

func enter() -> void:
	$"../../NormalCollision".disabled = true
	$"../../CrouchCollision".disabled = false

func update(_delta: float) -> void:
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.0, 0.5)
	
	
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
