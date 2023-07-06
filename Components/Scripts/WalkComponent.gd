extends Node

@onready var player: CharacterBody3D = get_parent()
@onready var head: Marker3D = player.find_child("Head")
@onready var animation_player: AnimationPlayer = player.find_child("AnimationPlayer")

const SPEED := 3.0
const FRICTION := 9.0

func walk(delta: float, speed: int) -> void:
	var input_dir := Input.get_vector("left", "right", "forward", "down")
	var direction := (Basis(Vector3.UP, head.rotation.y) * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if player.is_on_floor():
		if direction:
			player.velocity.x = direction.x * speed
			player.velocity.z = direction.z * speed
			animation_player.play("walk")
		else:
			player.velocity = lerp(player.velocity, Vector3.ZERO, FRICTION * delta)
			animation_player.play("idle")
	else:
		player.velocity.x = lerp(player.velocity.x, direction.x * speed, delta * 3)
		player.velocity.z = lerp(player.velocity.z, direction.z * speed, delta * 3)
