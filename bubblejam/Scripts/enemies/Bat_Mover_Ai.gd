extends CharacterBody2D

@export var Speed = 20
var direction :  Vector2
var player:CharacterBody2D
var initial_position
var trigger = false
const TRIGGER_LIMIT = 250

@onready var game_manger: Node = %GameManger
@onready var bat_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() ->void:
	initial_position = global_position
	
func _process(delta):
	move(delta)
	handle_aniamtion()
	
func move(delta):
	player = Global.playerBody
	if not trigger:
		var dist = global_position.distance_to(player.global_position)
		if dist < TRIGGER_LIMIT:
			trigger = true
	else:
		velocity = position.direction_to(player.position) * Speed
		direction.x = (abs(velocity.x) / velocity.x)
		move_and_slide()

func handle_aniamtion():
	
	if direction.x == -1: 
		bat_sprite.flip_h = false
	elif direction.x == 1 : 
		bat_sprite.flip_h = true


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		game_manger.remove_Health(1)
