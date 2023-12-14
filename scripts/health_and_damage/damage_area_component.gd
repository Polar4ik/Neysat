extends Area3D

@export var damage: float
@export var health_component: HealthComponent


func give_damage() -> void:
	health_component.take_damage(damage)


