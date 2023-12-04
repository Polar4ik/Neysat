extends State
class_name BasePlayerState


@export var player: CharacterBody3D
@export var head_node: Marker3D
@export var normal_collision_node: CollisionShape3D
@export var crouch_collision_node: CollisionShape3D

var input_vec: Vector2 = Vector2.ZERO

func head_lerp(to: float) -> void:
	head_node.position.y = lerpf(head_node.position.y, to, 0.5)

func move_input() -> void:
	input_vec = Input.get_vector("left", "right", "forward", "back")
