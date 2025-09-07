extends State


@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."

func enter()->void:
	sprite.play("attack")
	await  sprite.animation_finished
	statemachine.change_state("Idle")
