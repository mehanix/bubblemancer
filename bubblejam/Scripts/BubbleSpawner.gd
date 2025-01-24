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
		var bubble = bubblePart.instantiate()
		var mouse = get_global_mouse_position()
		var position_x = mouse.x - (int(mouse.x) % 5)
		var position_y = mouse.y - (int(mouse.y) % 5)

		bubble.position = Vector2(position_x, position_y)
		add_child(bubble) 
		
	pass
