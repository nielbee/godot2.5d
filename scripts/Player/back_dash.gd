extends State


@onready var sprite:AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body:CharacterBody2D = $"../.."
@onready var statemachine:StateMachine = $".."
@onready var fall :=$"../Fall"

@onready var timer:= Timer.new()

const BACKDASH_SPEED = 80
const DURATION = 0.2


# Called when the node enters the scene tree for the first time.
func enter() -> void:
	timer = Timer.new()
	timer.one_shot = true
	add_child(timer) # Add timer to the scene tree
	timer.timeout.connect(end)
	timer.start(DURATION)
	sprite.play("fall")
	body.movement.x = (body.lastFacing*BACKDASH_SPEED)*-1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func end():
	statemachine.change_state("Idle")
