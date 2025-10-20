extends Node2D

var _position_last_frame := Vector2()
var _cardinal_direction = 0
@onready var state_machine := $StateMachine
@export var health := 100
@export var MOVE_SPEED := 30

var player : Player

func _process(_delta):
	var motion = position - _position_last_frame
	if motion.length() > 0.0001:
		_cardinal_direction = int(4.0 * (motion.rotated(PI / 4.0).angle() + PI) / TAU)
		#match _cardinal_direction:
			#0: print("West")
			#1: print("North")
			#2: print("East")
			#3: print("South")
	_position_last_frame = position
	
	if health < 1 :
		queue_free() 
#		destroy if health below 0


func chase(delta):
	global_position = global_position.move_toward(MyPlayer.global_position, MOVE_SPEED * delta)
	global_position.normalized()

func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")[0]
	print (MOVE_SPEED)
	
	


func _on_hurtbox_area_entered(area: Area2D) -> void:
	print(area.name)
	if area.name == "player_sword":
		state_machine.change_state("hit")
