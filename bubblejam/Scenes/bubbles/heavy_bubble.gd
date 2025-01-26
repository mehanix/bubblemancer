extends CharacterBody2D

@export var SPEED: int = 150

@export var PROJECTILE_DAMAGE = 1

var spawn_pos: Vector2
var spawn_rot: float = 0
var zdex

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawn_pos
	global_rotation = 0
	velocity = Vector2(SPEED, 0).rotated(spawn_rot)
	z_index = zdex

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
	var collision = get_last_slide_collision()
	if collision != null:
		var obj = collision.get_collider()
		if obj is Node and obj.is_in_group("bat"):
			obj.queue_free()
		if obj is Node and not obj.is_in_group("player"):
			queue_free()

func _on_timer_timeout() -> void:
	queue_free() # delete after some time
