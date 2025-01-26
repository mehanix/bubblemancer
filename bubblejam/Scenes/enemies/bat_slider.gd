extends CharacterBody2D


@export var speed = 30
var direction: int = 1
var player:CharacterBody2D

const LIMIT_LEFT = -250
const LIMIT_RIGHT = 250

@onready var game_manger: Node = %GameManger
@onready var bat_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta):
	move(delta)
	handle_aniamtion()
	
func move(delta):
	player = Global.playerBody
	if global_position.x < LIMIT_LEFT or global_position.x > LIMIT_RIGHT:
		direction *= -1	
	velocity = direction * Vector2(speed, 0)
	move_and_slide()

func handle_aniamtion():
	if direction == -1: 
		bat_sprite.flip_h = false
	elif direction == 1 : 
		bat_sprite.flip_h = true

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		Global.playerHealth -= 1
