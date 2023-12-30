extends Node


var action_list := {
	"move": Callable(Input, "is_action_pressed")
}


func _unhandled_input(e: InputEvent) -> void:
	print(e.is_action_pressed("move", true))
