extends RigidBody2D


var textureRegion
var isNew = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var is_frozen = is_freeze_enabled()
	if Global.GameMode == Global.PlayMode:
		if is_frozen:
			set_freeze_enabled(false)
			isNew = false
	else:
		if !is_frozen:
			if isNew == true:
				set_freeze_enabled(true)
	pass


func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
