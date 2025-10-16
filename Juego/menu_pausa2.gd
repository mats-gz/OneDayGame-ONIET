extends Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Pausa.visible = false


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pausa"):
		get_tree().paused = not get_tree().paused
		$CanvasLayer/Pausa.visible = not $CanvasLayer/Pausa.visible
