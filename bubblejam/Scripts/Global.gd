extends Node
# Global variables and stuff
const PlayMode = "PLAY"
const DrawMode = "DRAW"
var GameMode = PlayMode

const BUBBLE_MAX_CAPACITY = 100
const BUBBLE_RECHARGE_RATE = 5 # per second

var BubbleReservoir = BUBBLE_MAX_CAPACITY
