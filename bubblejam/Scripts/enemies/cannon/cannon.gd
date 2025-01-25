extends Node2D

var angle: float = 0
var player = null
const CORRECTION = Vector2(0, -18)

@onready var root_scene = get_tree().get_root().get_node("Joc1")
@onready var projectile = load("res://Scripts/enemies/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		
func get_player_pos() -> Vector2:
	if player == null:
		player = get_tree().get_nodes_in_group("player")[0]
	return player.global_position
	
func look_at_player() -> void:
	$swivel_head.look_at(get_player_pos() + CORRECTION)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at_player()

func shoot() -> void:
	var player_pos = get_player_pos()
	var rot = $swivel_head.rotation
	var instance = projectile.instantiate()
	instance.spawn_rot = rot
	instance.spawn_pos = global_position
	instance.zdex = z_index - 1
	root_scene.add_child.call_deferred(instance)

func _on_timer_timeout() -> void:
	shoot()
