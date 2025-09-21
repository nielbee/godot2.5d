extends State

@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."
const FALL_ACC_SPEED:float=200
var acc:float=0


func enter()->void:
	Debugging.log("fall")
	sprite.play("fall")


func gravity(_delta):
	acc+=6
	
	body.movement.y = clamp(acc,0,FALL_ACC_SPEED)

func update(delta)->void:
	
	if body.is_on_floor():
		acc = 0
		statemachine.change_state("Idle")
	else:
		if Input.is_action_just_pressed("attack"):
			statemachine.change_state("Attack")
		gravity(delta)
