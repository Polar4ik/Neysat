extends Node3D

@export var ray_cast: RayCast3D
@export var climp_component: ClimpComponent

@export var except_area: Array[DamageArea]


var can_shoot := true

var decal := preload("res://objects/weapon/shoot_decal.tscn")


func _ready() -> void:
	EventManager.shoot.connect(shoot)
	EventManager.reload.connect(reload)
	
	for area in except_area:
		ray_cast.add_exception(area)


func shoot() -> void:
	if can_shoot == false or climp_component.can_shoot() == false:
		return
	
	climp_component.shoot_ammo(1)
	$ShootDelay.start()
	$AnimPlayer.play("shoot")
	can_shoot = false
	
	if not ray_cast.is_colliding():
		return
	
	var collider := ray_cast.get_collider()
	var shoot_decal := decal.instantiate()
	
	shoot_decal.position = ray_cast.get_collision_point()
	
	collider.get_parent().add_child(shoot_decal)
	
	if collider is DamageArea:
		collider.give_damage()


func reload() -> void:
	climp_component.reload()
	$AnimPlayer.play("reload")


func _on_shoot_delay_timeout() -> void:
	can_shoot = true
