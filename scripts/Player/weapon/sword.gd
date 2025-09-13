extends Node2D
class_name PlayerSword


@onready var hitbox_area2d:=$hitbox_area
@onready var hitbox_collider:=$hitbox_area/hitbox
@onready var sprite:=$AnimatedSprite2D

signal attack_finished

@onready var allowAttack:=true
func attack()->void:

		#allowAttack = false
		hitbox_collider.disabled=false
		sprite.show()
		sprite.play("default")
		await sprite.animation_finished
		endOfAttack()
		
func endOfAttack():
	#allowAttack = true
	hitbox_collider.disabled=true
	sprite.hide()
	emit_signal("attack_finished")
