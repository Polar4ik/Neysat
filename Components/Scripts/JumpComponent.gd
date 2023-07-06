extends Node

@onready var player: CharacterBody3D = get_parent()

const JUMP_VELOCITY := 4.0

func jump() -> void:
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY
