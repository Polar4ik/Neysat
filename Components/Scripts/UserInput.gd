extends Node

func _input(_event: InputEvent) -> void:
#	if Input.get_vector("left", "right", "forward", "down"):
#		Events.walk.emit()
	if Input.is_action_just_pressed("jump"):
		Events.jump.emit()
	if Input.is_action_pressed("sprint") and Input.is_action_pressed("forward"):
		Events.sprint.emit()
	if Input.is_action_just_pressed("left_lien"):
		Events.lien_left.emit()
	elif Input.is_action_just_pressed("right_lien"):
		Events.lien_right.emit()

func _physics_process(_delta: float) -> void:
	$"../WalkComponent".walk()
