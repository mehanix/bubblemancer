extends Node

@onready var game_manger: Node = %GameManger


@onready var label: Label = $"../Camera2D/Label"

func  _ready():

	label.text = str(Global.playerHealth) + "HP"

func _process(delta):
	
	label.text = str(Global.playerHealth) + "HP"
	
	if Global.playerHealth <= 0:
		get_tree().change_scene_to_file("res://Scenes/LevelDesign/Menu/MainMenu.tscn")
