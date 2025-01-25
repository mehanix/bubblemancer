extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var center = Vector2(global_position.x + 4, global_position.y + 4)
	var query = PhysicsRayQueryParameters2D.create(center, Vector2(center.x+5, center.y))
	var space_state = get_world_2d().direct_space_state	
	var result = space_state.intersect_ray(query)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var is_frozen = is_freeze_enabled()
	if Global.GameMode == Global.PlayMode:
		if is_frozen:
			set_freeze_enabled(false)
	else:
		if !is_frozen:
			set_freeze_enabled(true)

func _physics_process(delta):
	pass
