extends State

@onready var sprite : AnimatedSprite2D = $"../../Player/AnimatedSprite2D"
@onready var staticbody : StaticBody2D = $"../../Player"
@onready var path : Path2D = $"../../Path2D"
@onready var EnemyBluefly = $"../.."

func enter()->void:
	sprite.play("idle_fly")
func exit()->void:
	pass
func update(delta:float)->void:
	EnemyBluefly.chase(delta)
func physics_update(_delta:float)->void:
	pass
