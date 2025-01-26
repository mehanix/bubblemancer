extends Node


var Damage : float


func add_health():
	if Global.playerHealth <=3 :
		Global.playerHealth += 1
	print (Global.playerHealth)

func remove_Health(Damage):
	Global.playerHealth -= Damage
	print (Global.playerHealth)
