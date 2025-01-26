extends Control

var hpBarMax : float
var currentHP : float
var currentBubble: float
var bubbleBarMax : float
@onready var hp: TextureProgressBar = $HP
@onready var bubble_bar: TextureProgressBar = $BubbleBar

# Called when the node enters the scene tree for the first time.
func _ready():
	hpBarMax = Global.playerHealth
	bubbleBarMax = Global.BUBBLE_MAX_CAPACITY
	hp.max_value = hpBarMax
	bubble_bar.max_value = bubbleBarMax
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentHP = Global.playerHealth
	currentBubble = Global.BubbleReservoir
	bubble_bar.value = currentBubble
	hp.value = currentHP
	
	

func _on_hp_changed() -> void:
	pass



func _on_bubble_bar_changed() -> void:
	pass # Replace with function body.
