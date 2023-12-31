extends PlayerState
class_name WalkState

var speed := 1.0

@export var MAX_SPEED := 2.0
@export var acceleration := 4.0

var input := Vector2.ZERO

func _ready() -> void:
	EventManager.jump.connect(func():
		if is_active_state():
			change_to.emit("jump")
	)
	
	EventManager.sprint.connect(func():
		if is_active_state():
			change_to.emit("sprint")
		)


func enter() -> void:
	speed = MAX_SPEED


func update(_delta: float) -> void:
	input = Input.get_vector("left", "right", "forward", "back")
	
	if not Input.is_action_pressed("sprint"):
		change_to.emit("walk")

	if input == Vector2.ZERO:
		change_to.emit("idle")
	
	if player.is_on_floor() == false:
		change_to.emit("air")

func physics_update(delta: float) -> void:
	move(delta)


func move(delta: float) -> void:
	var direction = (player.transform.basis * Vector3(input.x, 0.0, input.y)).normalized()
	
	player.velocity = lerp(player.velocity, direction * speed, acceleration * delta)
