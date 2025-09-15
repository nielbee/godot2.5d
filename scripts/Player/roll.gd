extends State

@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."
@onready var fall :=$"../Fall"

const ROLL_SPEED = 150

func enter()->void:
	Debugging.log("roll")
	body.movement.x = Input.get_axis("ui_left","ui_right")*ROLL_SPEED
	sprite.play("roll")
	await sprite.animation_finished
	if !Input.is_action_just_released("roll"):
		statemachine.change_state("RunFaster")
		
	else:
		statemachine.change_state("Idle")

func update(delta)->void:
	
	if !body.is_on_floor():
		fall.gravity(delta)
	else:
		if Input.is_action_just_pressed("attack"):
			statemachine.change_state("Attack")
	if !Input.is_action_pressed("roll") :
		state_machine.change_state("Idle")
