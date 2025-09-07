extends State

@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."


@export var airTime := 0.5
var _airTime;
var doDoubleJump:bool=false
const JUMP_LIMIT = -280
const HORIZONTAL_AIR_SPEED = 60

func enter()->void:
	sprite.play("jump")
	_airTime = airTime
	
	
func physics_update(delta) -> void:
	jump(delta)
	if _airTime < 0:
		statemachine.change_state("Fall")
	
func jump(delta):

	body.movement.x = Input.get_axis("ui_left","ui_right")*HORIZONTAL_AIR_SPEED
	_airTime-= 2*delta
	# print(_airTime)
	body.movement.y = JUMP_LIMIT*_airTime
