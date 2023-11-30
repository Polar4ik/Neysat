extends State
class_name Idle

@onready var player: CharacterBody3D = $"../.."
@onready var head: Marker3D = $"../../Head"

var walk = false
var sprint = false

func _unhandled_input(_event: InputEvent) -> void:
	var input_vec: Vector2 = Input.get_vector("left", "right", "forward", "back")
	
	
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
	$"../../NormalCollision".disabled = false
	$"../../CrouchCollision".disabled = true
	
	if walk:
		change.emit(self, "walk")
	if sprint:
		change.emit(self, "sprint")

func update(_delta: float) -> void:
	$"../../Head".position.y = lerpf($"../../Head".position.y, 0.5, 0.5)
	if !player.is_on_floor():
		change.emit(self, "onair")


func physics_update(delta: float) -> void:
	if player.velocity != Vector3.ZERO:
		slow(delta)


func slow(delta: float) -> void:
	player.velocity.x = lerpf(player.velocity.x, 0.0, delta * 5.0)
	player.velocity.z = lerpf(player.velocity.z, 0.0, delta * 5.0)

