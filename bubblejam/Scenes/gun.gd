extends Node2D

var angle: float = 0
var player = null

@onready var root_scene = get_parent().get_parent()
@onready var projectile = load("res://Scenes/bubbles/HeavyBubble.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		
	
func look_at_player() -> void:
	look_at(get_global_mouse_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at_player()
	if Input.is_action_just_pressed("Shoot Heavy"):
		shoot()
		

func shoot() -> void:
	var player_pos = get_global_mouse_position()
	var rot = rotation
	var instance = projectile.instantiate()
	instance.spawn_rot = rot
	instance.spawn_pos = global_position
	instance.zdex = z_index - 1
	root_scene.aedd_child.call_deferred(instance)

func _on_timer_timeout() -> void:
	shoot()
