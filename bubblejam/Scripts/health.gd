extends Node

@onready var game_manger: Node = %GameManger
@onready var label: Label = $"../Camera2D/Label"

var startHP : float

func  _ready():
	startHP = Global.playerHealth
	label.text = str(startHP) + "HP"

func _process(delta):
	
	label.text = str(Global.playerHealth) + "HP"
	
	if Global.playerHealth <= 0:
		get_tree().change_scene_to_file("res://Scenes/LevelDesign/Menu/MainMenu.tscn")
		Global.playerHealth = startHP
