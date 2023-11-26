extends Node

var states = {}

var curent_state: State

@export var init_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.change.connect(change_state)
	
	if init_state:
		curent_state = init_state
		curent_state.enter()


func _process(delta: float) -> void:
	curent_state.update(delta)

func _physics_process(delta: float) -> void:
	curent_state.physics_update(delta)

func change_state(old_state, new_state_name) -> void:
	
	if curent_state != old_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	
	if new_state == null:
		return
	
	if curent_state:
		curent_state.exit()
	
	curent_state = new_state
	curent_state.enter()
