extends Node2D


func _ready() -> void:
	add_child(MyPlayer)
	MyPlayer.global_position = $spawnPosition.global_position
