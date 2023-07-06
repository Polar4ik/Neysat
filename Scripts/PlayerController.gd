extends CharacterBody3D

#enum StateMachine {
#	IDLE,
#	WALK,
#	JUMP,
#	SPRINT
#}
#var state := StateMachine.IDLE

func _physics_process(delta: float) -> void:
	gravity(delta)
	walk(delta)
	jump()
	sprint(delta)
	
	move_and_slide()

func walk(delta: float) -> void:
	$WalkComponent.walk(delta, $WalkComponent.SPEED)

func gravity(delta: float) -> void:
	$GravitationComponent.gravity(delta)

func jump() -> void:
	$JumpComponent.jump()

func sprint(delta: float) -> void:
	$SprintComponent.sprint(delta)
