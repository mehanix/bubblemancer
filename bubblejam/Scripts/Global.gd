extends Node
# Global variables and stuff
const PlayMode = "PLAY"
const DrawMode = "DRAW"
const MenuMode = "MENU"

var GameMode = PlayMode

const BUBBLE_MAX_CAPACITY = 15
const BUBBLE_RECHARGE_RATE = 1 # per 0.1s


var playerBody: CharacterBody2D
var BubbleReservoir = BUBBLE_MAX_CAPACITY
var PlayerLives = 3

#HP

var playerHealth: float
var maxHealth = 3

func _ready():
	Global.playerHealth = maxHealth
