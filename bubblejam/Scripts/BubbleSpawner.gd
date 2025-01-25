extends Node2D
# Script that handles bubble drawing mechanic.

var bubblePart = load("res://Scenes/MagicBubble.tscn") 
var bubbleAnchor = load("res://Scenes/BubbleAnchor.tscn") 
var bubbleParent = Node.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		Global.GameMode = Global.DrawMode
		bubbleParent = bubbleAnchor.instantiate() 
		add_child(bubbleParent)
		return
	if Input.is_action_pressed("click"):
		var position_x = mouse.x - (int(mouse.x) % 8)
		var position_y = mouse.y - (int(mouse.y) % 8)
		var obj = get_object_at_mouse_pos(position_x, position_y)
		if (len(obj) > 0): return
		if Global.BubbleReservoir == 0: return
		Global.BubbleReservoir -= 1
		var newBubble = bubblePart.instantiate()
		newBubble.add_to_group("instantiated_bubbles")
		newBubble.position = Vector2(position_x, position_y)
		bubbleParent.add_child(newBubble)
		return
	if Input.is_action_just_released("click"):
		Global.GameMode = Global.PlayMode
		return
		
	pass

func get_object_at_mouse_pos(position_x, position_y):
	var space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	var query = PhysicsPointQueryParameters2D.new()
	query.position = Vector2(position_x, position_y)
	query.collide_with_areas = true
	
	var result = space_state.intersect_point(query)
	print(result)
	return result


func _on_timer_timeout() -> void:
	if Global.GameMode == Global.DrawMode: return
	if Global.BubbleReservoir + Global.BUBBLE_RECHARGE_RATE <= Global.BUBBLE_MAX_CAPACITY:
		Global.BubbleReservoir += Global.BUBBLE_RECHARGE_RATE
	pass # Replace with function body.
