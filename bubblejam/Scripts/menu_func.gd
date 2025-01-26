extends Control




	


func _on_play_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/LevelDesign/GameplayScene.tscn")


func _on_quit_button_up() -> void:
	get_tree().quit()


func _on_credits_button_up() -> void:
	pass # Replace with function body.
