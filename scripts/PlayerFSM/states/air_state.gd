extends PlayerState

var walk_press := false

func _ready() -> void:
	EventManager.walk_pressed.connect(func(i_p):
		if get_parent().curent_state == self:
			walk_press = i_p
	)


func update(_delta: float) -> void:
	if player.is_on_floor():
		if walk_press:
			change_to.emit("walk")
		else:
			change_to.emit("idle")


func physics_update(delta: float) -> void:
	player.velocity.y -= 9.8 * delta
