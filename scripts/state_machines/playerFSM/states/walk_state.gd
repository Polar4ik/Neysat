extends PlayerState

var speed := 1.0

@export var MAX_SPEED := 1.0
@export var acceleration := 4.0

var input := Vector2.ZERO


func _ready() -> void:
	EventManager.move.connect(func():
		input = Input.get_vector("left", "right", "forward", "back")
		)
	
	EventManager.jump.connect(func():
		if get_parent().curent_state == self:
			change_to.emit("jump"))


func enter() -> void:
	speed = MAX_SPEED


func update(_delta: float) -> void:
	
	if player.is_on_floor() == false:
		change_to.emit("air")


func physics_update(delta: float) -> void:
	move(delta)


func move(delta: float) -> void:
	var direction = (player.transform.basis * Vector3(input.x, 0.0, input.y)).normalized()
	
	player.velocity = lerp(player.velocity, direction * speed, acceleration * delta)
