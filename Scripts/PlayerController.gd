extends CharacterBody3D

func _physics_process(delta: float) -> void:
	gravity(delta)
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	var sensity = 0.1
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * sensity

func gravity(delta: float) -> void:
	$GravitationComponent.gravity(delta)
