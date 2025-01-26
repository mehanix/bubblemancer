extends Control

var hpBarMax : float
var currentHP : float
var bubbleBarMax : float
var currentBubble: float
@onready var hp: TextureProgressBar = $HP

# Called when the node enters the scene tree for the first time.
func _ready():
	hpBarMax = Global.playerHealth
	hp.max_value = hpBarMax
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentHP = Global.playerHealth
	hp.value = currentHP
	
	

func _on_hp_changed() -> void:
	pass
