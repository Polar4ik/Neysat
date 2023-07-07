extends Node

@onready var player := get_parent()
@onready var animation_player := player.find_child("AnimationPlayer")

const SPEED := 3.0
const FRICTION := 9.0

#func _ready() -> void:
#	Events.walk.connect(walk)

func walk() -> void:
	var input_dir := Input.get_vector("left", "right", "forward", "down")
	var direction := (Basis(Vector3.UP, player.rotation.y) * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		player.velocity.x = direction.x * SPEED
		player.velocity.z = direction.z * SPEED
	else:
		player.velocity = lerp(player.velocity, Vector3.ZERO, FRICTION * get_physics_process_delta_time())
