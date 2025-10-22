extends State

@onready var sprite : AnimatedSprite2D = $"../../Player/AnimatedSprite2D"
@onready var staticbody : StaticBody2D = $"../../Player"
@onready var path : Path2D = $"../../Path2D"
@onready var EnemyBluefly = $"../.."
@onready var LOS := $"../../detectPlayerArea"
@onready var HurtArea := $"../../Player/hurtbox"
@onready var state := $".."
@onready var enemyroot := $"../.."

var KNOCKBACK_DISTANCE := 4.0

@onready var current_pos
func enter()->void:
	current_pos = staticbody.position.y
	sprite.play("hit")
	enemyroot.health -= 50
	await sprite.animation_finished
	state.change_state("chase")
	match enemyroot._cardinal_direction:
		0:
			KNOCKBACK_DISTANCE = -KNOCKBACK_DISTANCE
#match enemyroot._cardinal_direction:
			#0: 
				#print("West")
				#sprite.flip_h = false
			#1: print("North")
			#2: 
				#print("East")
				#sprite.flip_h = true
			#3: print("South")
	#_position_last_frame = position
func physics_update(_delta:float)->void:
	staticbody.position.y = lerpf(current_pos,KNOCKBACK_DISTANCE,0.2)
	
