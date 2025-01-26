extends Node

@onready var game_manger: Node = %GameManger

var startHP : float

func  _ready():
	startHP = Global.playerHealth
	
func _process(delta):
	
	if Global.playerHealth <= 0:
		get_tree().change_scene_to_file("res://Scenes/LevelDesign/Menu/MainMenu.tscn")
		Global.playerHealth = startHP
