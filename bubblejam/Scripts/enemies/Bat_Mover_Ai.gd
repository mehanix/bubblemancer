extends CharacterBody2D


@export var Speed = 20
var direction :  Vector2
var player:CharacterBody2D



@onready var bat_sprite: AnimatedSprite2D = $AnimatedSprite2D




func _process(delta):
	move(delta)
	handle_aniamtion()
	
func move(delta):
	player = Global.playerBody
	velocity = position.direction_to(player.position) * Speed
	direction.x = (abs(velocity.x) / velocity.x)
	move_and_slide()
	


func handle_aniamtion():
	
	if direction.x == -1: 
		bat_sprite.flip_h = false
	elif direction.x == 1 : 
		bat_sprite.flip_h = true
