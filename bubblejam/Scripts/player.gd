extends CharacterBody2D

@export_category("Movement")
@export var SPEED : int = 150.0
@export var JUMP_FORCE : int = 200.0
@export var Gravity : int = 900
var Jump_Available: bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D




func _physics_process(delta):
	var direction = Input.get_axis("MoveLeft", "MoveRight")
	
	#Movement
	
	if direction: 
		velocity.x = direction * SPEED
		if is_on_floor():
			animated_sprite_2d.play("Run")
		
		#Flip Sprite
		if direction == 1:
			animated_sprite_2d.flip_h = false
		elif direction == -1:
			animated_sprite_2d.flip_h = true
		
		
	else:
		velocity.x = 0
		if is_on_floor():
			animated_sprite_2d.play("Idle")
	
	#Gravity
	
	if not is_on_floor():
		velocity.y += Gravity*delta
		if velocity.y > 0 :
			animated_sprite_2d.play ("JumpFall")
	else: 
		Jump_Available = true

	#Jump
	
	if Input.is_action_just_pressed("Jump") and Jump_Available:
		velocity.y -= JUMP_FORCE
		Jump_Available = false
		animated_sprite_2d.play("JumpStart")
		
	move_and_slide()
	
