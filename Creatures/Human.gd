extends Area2D

var speed = 200 #pixels per second
var carrying_capacity = 100 # units
var active


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	active = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
