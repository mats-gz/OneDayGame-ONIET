extends Control

@onready var musica = $Musica_Menu
@onready var Botones = $Botones

@export var juego : PackedScene
@export var controles: PackedScene

func _ready():
	musica.play()

func _on_jugar_button_down() -> void:
	get_tree().change_scene_to_packed(juego)
	Botones.play()
	


func _on_opciones_button_down() -> void:
	get_tree().quit()
	Botones.play()
	


func _on_salir_button_down() -> void:
	get_tree().quit()
	Botones.play()


func _on_controles_button_down() -> void:
	get_tree().change_scene_to_packed(controles)
	Botones.play()
