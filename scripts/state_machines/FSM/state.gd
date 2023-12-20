extends Node
class_name State

signal change_to(new_state: String)

func enter() -> void:
	pass

func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func update(_delta: float) -> void:
	pass

func is_curent_state() -> bool:
	return get_parent().curent_state == self
