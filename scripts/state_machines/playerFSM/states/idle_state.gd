extends PlayerState

@export var friction := 6

func _ready() -> void:
	EventManager.move.connect(func(): change_to.emit("walk"))
	
	EventManager.jump.connect(func():
		if get_parent().curent_state == self:
			change_to.emit("jump"))

func update(_delta: float) -> void:
	if player.is_on_floor() == false:
		change_to.emit("air")

func physics_update(delta: float) -> void:
	if player.velocity != Vector3.ZERO:
		slow(delta)

func slow(delta: float) -> void:
	player.velocity = lerp(player.velocity, Vector3.ZERO, friction * delta)
