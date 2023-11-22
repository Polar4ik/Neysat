extends State

@onready var player: CharacterBody3D = $"../.."

func physics_update(_delta: float) -> void:
	if player.is_on_floor():
		player.velocity.y = 4.5
		change.emit(self, "onair")
