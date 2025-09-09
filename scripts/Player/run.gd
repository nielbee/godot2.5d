extends State

@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."
@onready var footparticles := $"../../runparticles"
const INIT_MOVE_SPEED : float = 20
const MOVE_ACC : float = 15
const MAX_MOVE_SPEED : float = 60

var acc : float = 0.0
var hspeed : float
var y :float
func enter()->void:
	footparticles.emitting = true
	sprite.play("run")

func exit()->void:
	hspeed=0
	acc=0
	y=0

func update(_delta)->void:
	if Input.is_action_just_pressed("attack"):
		statemachine.change_state("Attack")
	if (Input.is_action_just_pressed("jump")):
		statemachine.change_state("Jump")
	
	if(Input.get_axis("ui_left","ui_right") == 0):
		statemachine.change_state("Idle")
	else:
		acc += MOVE_ACC
		hspeed = (INIT_MOVE_SPEED+acc)
		y= Input.get_axis("ui_left","ui_right")*hspeed
		if Input.get_axis("ui_left","ui_right") < 0:
			body.flipsprite = true
			body.lastFacing =-1
		else :
			body.flipsprite = false
			body.lastFacing = 1
	body.set_horizontal_move(clamp(y,-MAX_MOVE_SPEED,MAX_MOVE_SPEED))


func physics_update(_delta)->void:
	if !body.is_on_floor():
		statemachine.change_state("fall")
	else:
		if Input.is_action_just_pressed("roll"):
			statemachine.change_state("Roll")
