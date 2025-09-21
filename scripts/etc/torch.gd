extends Node2D
@export var text:="your text here"


func _ready() -> void:
	$TextBox.set_text(text)

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	$AnimationPlayer.play("default")
	$PointLight2D2.enabled = true



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	$AnimationPlayer.pause()
	$PointLight2D2.enabled = false


func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.3,1.6)
	$AudioStreamPlayer2D.play()


func _on_interact_body_entered(body: Node2D) -> void:
	if body is Player:
		$TextBox.show()


func _on_interact_body_exited(body: Node2D) -> void:
	if body is Player:
		$TextBox.hide()
