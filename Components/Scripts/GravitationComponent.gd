extends Node

@onready var player: CharacterBody3D = get_parent()

const GRAVITY := 9.3

func gravity(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y -= GRAVITY * delta * 3
