extends IdleState

var walk = false
var sprint = false

func _unhandled_input(_event: InputEvent) -> void:
	move_input()
	
	if input_vec and not Input.is_action_pressed("sprint"):
		change.emit(self, "walk")
		walk = true
		sprint = false
	elif input_vec == Vector2.ZERO:
		walk = false
	
	if input_vec and Input.is_action_pressed("sprint"):
		change.emit(self, "sprint")
		sprint = true
		walk = false
	elif input_vec == Vector2.ZERO or not Input.is_action_pressed("sprint"):
		sprint = false
	
	if Input.is_action_just_pressed("jump"):
		change.emit(self, "jump")
	
	if Input.is_action_just_pressed("crouch"):
		change.emit(self, "crouch")


func enter() -> void:
	normal_collision_node.disabled = false
	crouch_collision_node.disabled = true
	
	if walk:
		change.emit(self, "walk")
	if sprint:
		change.emit(self, "sprint")


func update(_delta: float) -> void:
	head_lerp(0.5)
	
	if !player.is_on_floor():
		change.emit(self, "onair")
