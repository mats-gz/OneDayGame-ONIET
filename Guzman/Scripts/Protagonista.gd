extends CharacterBody2D

#region Variables de entorno
const SPEED = 200.0
const JUMP_VELOCITY = -350.0
#endregion

#region Variables externas
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
#endregion

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("mover_izq", "mover_der")
	
	#Mover la dirección de Animación
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	#Animaciones del Protagonista
	if direction == 0:
		animated_sprite_2d.play("Quieto")
	elif direction != 0:
		animated_sprite_2d.play("Corriendo")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
