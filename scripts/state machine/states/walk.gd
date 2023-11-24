extends State
class_name Walk

@onready var player: CharacterBody3D = $"../.."
@onready var head: Marker3D = $"../../Head"

var WALK_SPEED: float = 5.0

var speed: float = 0.0

var input_vec: Vector2
var direction: Vector3

func _ready() -> void:
	EI.move_input.connect(func(iv): input_vec = iv)
#	EI.sprint_input.connect(func(_iv): change.emit(self, "sprint"))
	EI.jump.connect(func(): change.emit(self, "jump"))


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
