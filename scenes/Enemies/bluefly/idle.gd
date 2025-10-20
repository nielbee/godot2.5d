extends State

@onready var sprite : AnimatedSprite2D = $"../../Player/AnimatedSprite2D"
@onready var staticbody : StaticBody2D = $"../../Player"
@onready var path : Path2D = $"../../Path2D"
@onready var EnemyBluefly = $"../.."
@onready var LOS := $"../../detectPlayerArea"
@onready var HurtArea := $"../../Player/hurtbox"
@onready var state := $".."


func enter()->void:
	LOS.connect("body_entered",on_sigth)
	HurtArea.connect("area_entered",hitted)
func exit()->void:
	pass
func update(_delta:float)->void:
	pass
func physics_update(_delta:float)->void:
	pass


func on_sigth(body:Node2D)->void:
	print(body.name)
	state.change_state("chase")

func hitted(area:Node2D)->void:
	print(area.name)
	
