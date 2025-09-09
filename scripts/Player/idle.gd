extends State

@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."
@onready var footparticles := $"../../runparticles"
@onready var fall :=$"../Fall"

func enter()->void:
	footparticles.emitting = false
	body.set_horizontal_move(0)
	sprite.play("idle")

#
#func update(_delta)->void:
	#if in


func physics_update(delta)->void:
	if !body.is_on_floor():
		fall.gravity(delta)
	else:
		if Input.is_action_just_pressed("roll"):
			statemachine.change_state("BackDash")
	
	
	if(Input.get_axis("ui_left","ui_right") != 0):
		statemachine.change_state("Run")
	if Input.is_action_pressed("jump") and body.is_on_floor():
		statemachine.change_state("jump")
	if Input.is_action_just_pressed("attack"):
		statemachine.change_state("Attack")
