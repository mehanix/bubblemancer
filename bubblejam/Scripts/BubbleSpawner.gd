extends Node2D
# Script that handles bubble drawing mechanic.

var bubblePart = load("res://Scenes/MagicBubble.tscn") 
var bubbleParentNode = Node.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bubbleParentNode = Node.new()
	add_child(bubbleParentNode)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("click"):
		var bubbles_on_screen = get_tree().get_nodes_in_group("bubbles")
		var mouse = get_global_mouse_position()
		var position_x = mouse.x - (int(mouse.x) % 5)
		var position_y = mouse.y - (int(mouse.y) % 5)
		var obj = get_object_at_mouse_pos(position_x, position_y)
		print(obj)
		if (len(obj) > 0): return
		var newBubble = bubblePart.instantiate()
		newBubble.add_to_group("instantiated_bubbles")


		newBubble.position = Vector2(position_x, position_y)
		add_child(newBubble) 
		
	pass

func get_object_at_mouse_pos(position_x, position_y):
	var space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	var query = PhysicsPointQueryParameters2D.new()
	query.position = Vector2(position_x, position_y)
	var result = space_state.intersect_point(query)
	return result
