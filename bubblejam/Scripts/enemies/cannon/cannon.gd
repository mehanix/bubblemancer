extends Node2D

var angle: float = 0
var player = null
const CORRECTION = Vector2(0, -18)
const RANGE = 500

@onready var root_scene = get_parent()
@onready var projectile = load("res://Scripts/enemies/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var circle = Texture2D.new()
	pass
		
func get_player_pos() -> Vector2:
	if player == null:
		var found_vec = get_tree().get_nodes_in_group("player")
		if len(found_vec):
			player = found_vec[0]
	return player.global_position if player else Vector2(0, 0)
	
func look_at_player() -> void:
	$swivel_head.look_at(get_player_pos() + CORRECTION)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at_player()

func shoot() -> void:
	var player_pos = get_player_pos()
	var rot = $swivel_head.global_rotation
	var instance = projectile.instantiate()
	instance.spawn_rot = rot
	instance.spawn_pos = global_position
	instance.zdex = z_index - 1
	root_scene.add_child.call_deferred(instance)

func _on_timer_timeout() -> void:
	var dist_to_player = get_player_pos().distance_to(global_position)
	if dist_to_player <= RANGE:
		shoot()
