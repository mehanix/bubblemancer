extends Node
#chunky chonky chunker
const DIFFICULTY_V_EASY = 0
const DIFFICULTY_EASY = 1
const DIFFICULTY_MEDIUM = 2
const DIFFICULTY_HIGH = 3

const CHUNK_TYPE_1 = 0
const CHUNK_TYPE_2 = 1
const CHUNK_TYPE_3 = 2

const CHUNK_HEIGHT = 100
# TODO FILL IN BY BOGDAN
const tutorial_chunks = [
	preload("res://Scenes/chunk.tscn"),
	preload("res://Scenes/chunk.tscn"),

]

const chunks = [
	# V EASY CHUNKS
	[
		preload("res://Scenes/chunk.tscn"),
		preload("res://Scenes/chunk.tscn"),
		preload("res://Scenes/chunk.tscn"),
	],
	# EASY CHUNKS
	[
		preload("res://Scenes/chunk.tscn"),
		preload("res://Scenes/chunk.tscn"),
		preload("res://Scenes/chunk.tscn"),
	],
	# MEDIUM CHUNKS
	[
		preload("res://Scenes/chunk.tscn"),
		preload("res://Scenes/chunk.tscn"),
		preload("res://Scenes/chunk.tscn"),
	],
	# HARD CHUNKS
	[
		preload("res://Scenes/chunk.tscn"),
		preload("res://Scenes/chunk.tscn"),
		preload("res://Scenes/chunk.tscn"),
	]
	]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# load tutorial chunks
	var y = 450
	for chunk_scene in tutorial_chunks:
		var chunk = chunk_scene.instantiate()
		chunk.position = Vector2(250, y) 
		
		add_child(chunk)
		y -= CHUNK_HEIGHT
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
