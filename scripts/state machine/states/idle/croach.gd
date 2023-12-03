extends IdleState

var not_crouch: bool = false

@export var roof_detecter: RayCast3D

func enter() -> void:
	not_crouch = false
	
	normal_collision_node.disabled = true
	crouch_collision_node.disabled = false

func _unhandled_input(_event: InputEvent) -> void:
	
	input_vec = Input.get_vector("left", "right", "forward", "back")
	
	if Input.is_action_just_released("crouch") and not roof_detecter.is_colliding():
		change.emit(self, "idle")
	elif not Input.is_action_pressed("crouch") and roof_detecter.is_colliding():
		not_crouch = true
	
	if input_vec:
		change.emit(self, "crouchwalk")
	

func update(_delta: float) -> void:
	head_lerp(0.0)
	
	if not_crouch and not roof_detecter.is_colliding():
		change.emit(self, "idle")
