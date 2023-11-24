extends State

@onready var player: CharacterBody3D = $"../.."
@onready var head: Marker3D = $"../../Head"

var walk_input_vec: Vector2
var sprint_input_vec: Vector2

func _ready() -> void:
	EI.move_input.connect(func(iv): 
		walk_input_vec = iv
		change.emit(self, "walk"))
	
	
	EI.sprint_input.connect(func(iv):
		sprint_input_vec = iv
		change.emit(self, "sprint"))
	
	
	EI.jump.connect(func(): change.emit(self, "jump"))


func enter() -> void:
	if walk_input_vec:
		change.emit(self, "walk")
	
	if sprint_input_vec:
		change.emit(self, "sprint")

func update(delta: float) -> void:
	head.position.y = sin(Time.get_ticks_msec() * 0.005) / 100.0
	
	if !player.is_on_floor():
		change.emit(self, "onair")


func physics_update(delta: float) -> void:
	if player.velocity != Vector3.ZERO:
		slow(delta)


func slow(delta: float) -> void:
	player.velocity.x = lerpf(player.velocity.x, 0.0, delta * 5.0)
	player.velocity.z = lerpf(player.velocity.z, 0.0, delta * 5.0)

