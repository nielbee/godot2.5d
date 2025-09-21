extends State

@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."


@export var airTime := 0.5
var _airTime;
var doDoubleJump:bool=false
const JUMP_LIMIT = -270
const HORIZONTAL_AIR_SPEED = 130

func enter()->void:
	body.movement.y = JUMP_LIMIT
	Debugging.log("long jump")
	sprite.play("roll")
	_airTime = airTime
	
	
func physics_update(delta) -> void:
	jump(delta)
	if _airTime < 0:
		statemachine.change_state("Fall")
	
func jump(delta):
	if Input.is_action_just_pressed("attack"):
		statemachine.change_state("Attack")
	body.movement.x = Input.get_axis("ui_left","ui_right")*HORIZONTAL_AIR_SPEED
	_airTime-= 2*delta
	# print(_airTime)
	body.movement.y = JUMP_LIMIT*_airTime
