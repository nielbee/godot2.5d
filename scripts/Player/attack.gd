extends State


@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."
@onready var fall :=$"../Fall"
func enter()->void:
	sprite.play("attack")
	await  sprite.animation_finished
	statemachine.change_state("Idle")

func physcis_update(delta)->void:
		if !body.is_on_floor():
			fall.gravity(delta)
