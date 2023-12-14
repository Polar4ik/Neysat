extends Node3D

@export var hit_ray_cast: RayCast3D

var can_shoot := true

func _ready() -> void:
	EventManager.shoot.connect(shoot)


func shoot() -> void:
	if can_shoot == false or $AnimationPlayer.is_playing():
		return
	
	if hit_ray_cast.is_colliding() == false:
		return
	
	var hit_area = hit_ray_cast.get_collider()
	hit_area.give_damage()
	
	$AnimationPlayer.play("shoot")
	can_shoot = false
	
	$FireDelay.start()


func _on_fire_delay_timeout() -> void:
	can_shoot = true
