extends Area3D
class_name DamageArea

@export var damage: float
@export var health_component: HealthComponent


func give_damage() -> void:
	if health_component:
		health_component.take_damage(damage)


