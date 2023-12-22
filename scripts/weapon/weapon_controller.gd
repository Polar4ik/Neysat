extends Node3D

@export var magazine_component: MagazineComponent

@export var ray_cast: RayCast3D
@export var damage_area: Array[DamageArea]

var can_shoot := true


@export var shoot_decal := preload("res://objects/weapon/shoot_decal.tscn")


func _ready() -> void:
	
	for area: DamageArea in damage_area:
		ray_cast.add_exception(area)
	
	
	EventManager.shoot.connect(shoot)
	EventManager.reload.connect(reload)
	
	magazine_component.is_reload.connect(
		func():
		can_shoot = true
		)

func shoot() -> void:
	if not can_shoot:
		return
	
	magazine_component.shoot()
	$Animation.play("shoot")
	can_shoot = false
	$ShootDelay.start()
	
	
	if ray_cast.is_colliding():
		var collider := ray_cast.get_collider()
		
		var decal_inst := shoot_decal.instantiate()
		decal_inst.position = ray_cast.get_collision_point()
		collider.get_parent().add_child(decal_inst)
		
		if collider is DamageArea:
			collider.give_damage()



func reload() -> void:
	magazine_component.reload()
	$Animation.play("reload")
	can_shoot = false


func _on_shoot_delay_timeout() -> void:
	if magazine_component.ammo_have():
		can_shoot = true
