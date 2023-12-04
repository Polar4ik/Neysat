extends Node
class_name State

signal change(old, new)

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func input_key(_event: InputEvent) -> void:
	pass
