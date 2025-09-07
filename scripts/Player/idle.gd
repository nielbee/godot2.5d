extends State

@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."
@onready var footparticles := $"../../runparticles"
func enter()->void:
	footparticles.emitting = false
	body.set_horizontal_move(0)
	sprite.play("idle")


func physics_update(_delta)->void:
	if(Input.get_axis("ui_left","ui_right") != 0):
		statemachine.change_state("Run")
	if Input.is_action_pressed("jump") and body.is_on_floor():
		statemachine.change_state("jump")
