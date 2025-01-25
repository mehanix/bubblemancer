extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var is_frozen = is_freeze_enabled()
	print(is_frozen)
	if Global.GameMode == Global.PlayMode:
		if is_frozen:
			set_freeze_enabled(false)
	else:
		if !is_frozen:
			set_freeze_enabled(true)

func _physics_process(delta):
	pass
