extends CharacterBody2D


const SPEED = 350.0

# 1 or -1
#var direction = [-1, 1][randi() % 2]
var direction = -1

func should_change_direction() -> bool:
	if not $GroundRayLeft.is_colliding():
		return true
	if not $GroundRayRight.is_colliding():
		return true
	return false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if should_change_direction():
		direction *= -1 # change direction when losing groun
		
	velocity.x = direction * SPEED
	
	move_and_slide()
