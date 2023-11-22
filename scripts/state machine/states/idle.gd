extends State

@onready var player: CharacterBody3D = $"../.."

func _ready() -> void:
	EI.move.connect(func(): change.emit(self, "walk"))
	EI.jump.connect(func(): change.emit(self, "jump"))

func physics_update(_delta: float) -> void:
	if !player.is_on_floor():
		change.emit(self, "onair")
	
