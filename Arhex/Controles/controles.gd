extends Control

@export var Men : PackedScene

func _on_volver_button_down() -> void:
	get_tree().change_scene_to_packed(Men)
	
