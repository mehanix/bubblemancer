extends Node

var Damage : float

func _ready():	
	pass

func add_health():
	if Global.playerHealth <=3 :
		Global.playerHealth += 1

func remove_Health(Damage):
	Global.playerHealth -= Damage
