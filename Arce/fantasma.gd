extends Node2D

@export var speed = 400 # How fast the player will move (pixels/sec).
signal hit
var velocity = 40
var direction = 1

@onready var protagonista: CharacterBody2D = $"../../Protagonista"
@onready var timer_hud: Timer = $"../../HUD/Timer"
@onready var ray_cast_der: RayCast2D = $RayCastDer
@onready var ray_cast_izq: RayCast2D = $RayCastIzq
@onready var animacion_sprite: AnimatedSprite2D = $Ghost_2D

func _ready() -> void:
	add_to_group("ghost")

func _process(delta: float) -> void:
	if ray_cast_der.is_colliding():
		direction = -1
		animacion_sprite.flip_h = true
		
	if ray_cast_izq.is_colliding():
		direction = 1
		animacion_sprite.flip_h = false
		
	position.x += delta * velocity * direction
	
	animacion_sprite.play("Idle")

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("Protagonista"):
		print("me pego")
	hit.emit()
