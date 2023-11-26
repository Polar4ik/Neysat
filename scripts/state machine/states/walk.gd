extends State
class_name Walk

@onready var player: CharacterBody3D = $"../.."
@onready var head: Marker3D = $"../../Head"

var WALK_SPEED: float = 5.0

var speed: float = 0.0

var input_vec: Vector2
var direction: Vector3


func _unhandled_input(_event: InputEvent) -> void:
	input_vec = Input.get_vector("left", "right", "forward", "back")
	
	if Input.is_action_pressed("sprint"):
		change.emit(self, "sprint")
	
	if not Input.is_action_pressed("sprint"):
		change.emit(self, "walk")
	
	if Input.is_action_just_pressed("jump"):
		change.emit(self, "jump")


func enter() -> void:
	speed = WALK_SPEED


func update(_delta: float) -> void:
	if input_vec == Vector2.ZERO:
		change.emit(self, "idle")


func physics_update(delta: float) -> void:
	move(delta)


func move(delta: float) -> void:
	direction = (player.transform.basis * Vector3(input_vec.x, 0, input_vec.y)).normalized()
	
	player.velocity.x = lerpf(player.velocity.x, speed * direction.x, delta * 2.0)
	player.velocity.z = lerpf(player.velocity.z, speed * direction.z, delta * 2.0)
