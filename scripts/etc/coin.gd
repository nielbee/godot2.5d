extends Area2D

class_name Coin

@onready var idleSprite = $idle
@onready var taken = $taken

func _ready() -> void:
	idleSprite.play("default")

func coinTaken():
	idleSprite.set("visible",false)
	taken.set("visible",true)
	taken.play("taken")
	await taken.animation_finished
	queue_free()
	


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		coinTaken()
