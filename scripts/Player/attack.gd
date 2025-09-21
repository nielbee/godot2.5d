extends State


@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."
@onready var fall :=$"../Fall"
@onready var sword:PlayerSword

func enter()->void:
	Debugging.log("attack")
	if body.lastFacing < 0:
		sword = $"../../SwordLeft"
	else:
		sword = $"../../SwordRigth"
	
	
	sword.attack()
	sprite.play("attack")
	await sprite.animation_finished
	if body.is_on_floor():
		statemachine.change_state("Idle")
	else:
		statemachine.change_state("Fall")
func physcis_update(delta)->void:
		if !body.is_on_floor():
			fall.gravity(delta)
