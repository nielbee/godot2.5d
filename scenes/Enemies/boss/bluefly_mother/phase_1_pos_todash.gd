extends State
const SPEED := 10.0


@onready var body := $"../.."
@onready var sprite := $"../../sprite"
@onready var areadetectplayervertical := $"../../sprite/areaDetectPlayerVertical"
@onready var state := $".."
func enter()->void:
	areadetectplayervertical.connect("body_entered",playerfound)
	
	
func playerfound()->void:
	state.change_state("dash_attack")


func physics_update(_delta:float)->void:
	body.velocity.y = lerp(body.velocity.y,MyPlayer.position.y,SPEED)
	body.move_and_slide()
