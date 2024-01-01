extends Node


var action_list := {
	"move": Callable(Input, "is_action_pressed"),
	"jump": Callable(Input, "is_action_just_pressed"),
	"sprint": Callable(Input, "is_action_pressed"),
	"interaction": Callable(Input, "is_action_just_pressed"),
	
}


func _unhandled_input(e: InputEvent) -> void:
	if e.is_action_type():
		for action in action_list:
			if e.is_action(action, false):
					event_emit_signal(action)
	
	if e is InputEventMouseMotion:
		EventManager.head_mouse_rotation.emit(e.relative)
	

func event_emit_signal(action: String) -> void:
	if action in action_list and action_list[action].call(action):
		EventManager.emit_signal(action)
