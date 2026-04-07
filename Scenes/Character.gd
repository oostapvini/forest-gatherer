extends CharacterBody2D

@export var SPEED = 200.0
@export var JUMP_VELOCITY = -420.0

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.wada
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		anim.flip_h = direction > 0
		if is_on_floor():
			anim.play("Walk")
		else:
			anim.play("Jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("Idle")

	move_and_slide()
