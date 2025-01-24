extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -200.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.play("JumpFall")
		
		

	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("MoveLeft", "MoveRight")
		
	#Flip Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false	
	elif direction <0: 
			animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0: 
			animated_sprite_2d.play("Idle")
		else:
			animated_sprite_2d.play("Run")

			
	#Movment
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("JumpStart")

	move_and_slide()
