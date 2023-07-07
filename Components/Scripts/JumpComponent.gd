extends Node

@onready var player: CharacterBody3D = get_parent()

const JUMP_VELOCITY := 10.0

func _ready() -> void:
	Events.jump.connect(jump)

func jump() -> void:
	if player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY
