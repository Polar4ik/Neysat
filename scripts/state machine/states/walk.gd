extends State

@onready var player: CharacterBody3D = $"../.."
@onready var head: Marker3D = $"../../Head"

var speed: float = 5.0
var friction: float = 9.0
var acceleration: float = 0.2

var input_vec: Vector2
var direction

func _ready() -> void:
	EI.move_input.connect(func(iv): input_vec = iv)

func update(_delta: float) -> void:
	print(direction)
	
	if input_vec == Vector2.ZERO:
		change.emit(self, "idle")

func physics_update(_delta: float) -> void:
	move()

func move() -> void:
	direction = (Basis(Quaternion(Vector3(0, 1, 0), head.rotation.y)) * Vector3(input_vec.x, 0, input_vec.y)).normalized()
	
	player.velocity.x = speed * direction.x
	player.velocity.z = speed * direction.z
	
