extends State
class_name PlayerState

@export var player: CharacterBody3D


func is_active_state() -> bool:
	return get_parent().curent_state == self
