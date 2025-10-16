extends Control

@onready var musica = $Musica_Menu

func _ready():
	musica.play()

func _on_jugar_button_down() -> void:
	get_tree().quit()
	


func _on_opciones_button_down() -> void:
	get_tree().quit()
	


func _on_salir_button_down() -> void:
	get_tree().quit()
