extends CharacterBody2D

class_name Player
signal is_jumping
signal is_melee
signal is_melee_finished
var jump_released: bool = true



var movement:Vector2 = Vector2.ZERO
var flipsprite := false
@onready var lastFacing:=1

func can_jump() -> bool:
	return jump_released and is_on_floor()  # or your ground check

func set_horizontal_move(x_value):
	movement.x= x_value
func set_vertical_move(y_value):
	movement.y =y_value
	
	
func _physics_process(_delta: float) -> void:
	$AnimatedSprite2D.flip_h = flipsprite
	#gravity(delta)
	if Input.is_action_just_released("jump"):
		jump_released = true
	velocity = movement	
	move_and_slide()
	
