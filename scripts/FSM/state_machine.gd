extends Node

var states: Dictionary = {}
var curent_state: State

@export var init_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.change_to.connect(change_state)
	
	curent_state = init_state



func _process(delta: float) -> void:
	curent_state.update(delta)


func _physics_process(delta: float) -> void:
	curent_state.physics_update(delta)


func change_state(new_state_name: String) -> void:
	var new_state: State = states.get(new_state_name.to_lower())
	if new_state == null:
		return
	
	curent_state.exit()
	curent_state = new_state
	curent_state.enter()

