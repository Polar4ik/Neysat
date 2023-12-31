extends PlayerState

@export var friction := 6

var sprint := false

func _ready() -> void:
	EventManager.sprint.connect(func():
		if is_active_state():
			sprint = true
		)

	EventManager.move.connect(func():
		if is_active_state():
			if sprint:
				change_to.emit("sprint")
			else:
				change_to.emit("walk")
		)
	
	EventManager.jump.connect(func():
		if is_active_state():
			change_to.emit("jump")
		)


func update(_delta: float) -> void:
	if not Input.is_action_pressed("sprint"):
		sprint = false
	
	if player.is_on_floor() == false:
		change_to.emit("air")


func physics_update(delta: float) -> void:
	if player.velocity != Vector3.ZERO:
		slow(delta)


func slow(delta: float) -> void:
	player.velocity = lerp(player.velocity, Vector3.ZERO, friction * delta)
