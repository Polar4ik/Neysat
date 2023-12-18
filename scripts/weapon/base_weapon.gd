extends Node3D

@export var ray_cast: RayCast3D
@export var climp_component: ClimpComponent

@export var except_area : Array[DamageArea]

var can_shoot := true
var no_ammo := false

var decal := preload("res://objects/weapon/shoot_decal.tscn")


func _ready() -> void:
	EventManager.shoot.connect(shoot)
	EventManager.reload.connect(reload)
	
	climp_component.no_ammo.connect(func(): no_ammo = true)
	climp_component.is_reload.connect(func(): no_ammo = false)
	
	for area in except_area:
		ray_cast.add_exception(area)

func shoot() -> void:
	if not can_shoot or no_ammo:
		return
	
	climp_component.shoot_ammo(1)
	can_shoot = false
	$ShootDelay.start()
	
	if not ray_cast.is_colliding():
		return
	
	
	var collider := ray_cast.get_collider()
	
	#region Decal
	var decal_inst := decal.instantiate()
	decal_inst.position = ray_cast.get_collision_point()
	
	collider.get_parent().add_child(decal_inst)
	#endregion
	
	
	if collider is DamageArea:
		collider.give_damage()
	

func reload() -> void:
	climp_component.reload()


func _on_shoot_delay_timeout() -> void:
	can_shoot = true
