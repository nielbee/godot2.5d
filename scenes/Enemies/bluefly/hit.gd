extends State

@onready var sprite : AnimatedSprite2D = $"../../Player/AnimatedSprite2D"
@onready var staticbody : StaticBody2D = $"../../Player"
@onready var path : Path2D = $"../../Path2D"
@onready var EnemyBluefly = $"../.."
@onready var LOS := $"../../detectPlayerArea"
@onready var HurtArea := $"../../Player/hurtbox"
@onready var state := $".."
@onready var enemyroot := $"../.."


func enter()->void:
	sprite.play("hit")
	enemyroot.health -= 50
	await sprite.animation_finished
	state.change_state("chase")
	
