extends PlayerState

var walk_press := false
var sprint := false

func _ready() -> void:
	EventManager.move.connect(func():
		walk_press = true
		)
	
	EventManager.sprint.connect(func():
		sprint = true
		)


func update(_delta: float) -> void:
	if not Input.is_action_pressed("move"):
		walk_press = false
	if not Input.is_action_pressed("sprint"):
		sprint = false
	
	if not player.is_on_floor():
		return
	
	if walk_press and sprint:
		change_to.emit("sprint")
	elif walk_press:
		change_to.emit("walk")
	else:
		change_to.emit("idle")


func physics_update(delta: float) -> void:
	player.velocity.y -= 9.8 * delta
