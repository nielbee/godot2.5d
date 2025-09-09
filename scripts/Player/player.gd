extends CharacterBody2D

class_name Player


var movement:Vector2 = Vector2.ZERO
var flipsprite := false
@onready var lastFacing:=1


func set_horizontal_move(x_value):
	movement.x= x_value
func set_vertical_move(y_value):
	movement.y =y_value
	
	
func _physics_process(_delta: float) -> void:
	$AnimatedSprite2D.flip_h = flipsprite
	#gravity(delta)
	velocity = movement	
	move_and_slide()
	
