extends State

@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."


@export var airTime := 0.5
var _airTime;
var doDoubleJump:bool=false
const JUMP_LIMIT = -160
const HORIZONTAL_AIR_SPEED = 60
#for add force when holding button
var buttonHold:=0.0
var maxButtonhold:=3.0
const ADD_MODIFIER = 0.2

func enter()->void:
	body.emit_signal("is_jumping")
	sprite.play("jump")
	_airTime = airTime
	body.movement.y = JUMP_LIMIT

func exit():
	buttonHold=0
	
func physics_update(delta) -> void:
	Debugging.log(str(buttonHold))
	if Input.is_action_pressed("jump"):
		buttonHold+=ADD_MODIFIER
		buttonHold=clamp(buttonHold,0,maxButtonhold)
	jump(delta)
	if _airTime < 0 or Input.is_action_just_released("jump"):
		statemachine.change_state("Fall")
	
func jump(delta):
	if Input.is_action_just_pressed("attack"):
		statemachine.change_state("Attack")
	body.movement.x = Input.get_axis("ui_left","ui_right")*HORIZONTAL_AIR_SPEED
	_airTime-= buttonHold*delta
	# print(_airTime)
	body.movement.y = JUMP_LIMIT*_airTime
