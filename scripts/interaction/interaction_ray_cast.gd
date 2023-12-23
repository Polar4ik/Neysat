extends RayCast3D


func _process(_delta: float) -> void:
	if is_colliding():
		var interact_obj = get_collider()
		
		$InteractLabel.text = interact_obj.get_promt()
	else:
		$InteractLabel.text = ""
