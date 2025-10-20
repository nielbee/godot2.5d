extends Node2D
class_name PlayerSword


@onready var hitbox_area2d:=$player_sword
@onready var hitbox_collider:=$player_sword/hitbox
@onready var sprite:=$AnimatedSprite2D

signal attack_finished

@onready var allowAttack:=true
func _ready() -> void:
	sprite.hide()
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
