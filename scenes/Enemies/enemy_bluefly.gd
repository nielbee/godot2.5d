extends Node2D


@export var MOVE_SPEED := 30

var player : Player


func chase(delta):
	global_position = global_position.move_toward(MyPlayer.global_position, MOVE_SPEED * delta)
	global_position.normalized()

func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")[0]
	print (MOVE_SPEED)
	
	
