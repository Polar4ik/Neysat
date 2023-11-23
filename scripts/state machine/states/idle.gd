extends State

@onready var player: CharacterBody3D = $"../.."

var input_vec

func _ready() -> void:
	EI.move_input.connect(func(iv): 
		input_vec = iv
		change.emit(self, "walk"))
	EI.jump.connect(func(): change.emit(self, "jump"))

func enter() -> void:
	if input_vec:
		change.emit(self, "walk")

func update(_delta: float) -> void:
	if !player.is_on_floor():
		change.emit(self, "onair")

func physics_update(delta: float) -> void:
	slow(delta)

func slow(delta: float) -> void:
	player.velocity.x = lerpf(player.velocity.x, 0.0, delta * 9.0)
	player.velocity.z = lerpf(player.velocity.z, 0.0, delta * 9.0)

