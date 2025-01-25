extends CharacterBody2D


@export var Speed = 40
var direction :  Vector2
var player:CharacterBody2D
var offset_x = 0
var offset_x_delta = 40
const OFFSET_X_LIMIT = 60
const OFFSET_Y = -70


@onready var bat_sprite: AnimatedSprite2D = $AnimatedSprite2D




func _process(delta):
	move(delta)
	handle_aniamtion()
	
func move(delta):
	player = Global.playerBody
	velocity = position.direction_to(player.position + Vector2(offset_x, OFFSET_Y)) * Speed
	direction.x = (abs(velocity.x) / velocity.x)
	move_and_slide()
	
	if offset_x >= OFFSET_X_LIMIT || offset_x <= -OFFSET_X_LIMIT:
		offset_x_delta *= -1
	offset_x += offset_x_delta * delta


func handle_aniamtion():
	
	if direction.x == -1: 
		bat_sprite.flip_h = false
	elif direction.x == 1 : 
		bat_sprite.flip_h = true
