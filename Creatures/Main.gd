extends Node

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = $Player/Human.get_viewport_rect().size
	$StartScreen.connect("start",self, "start_game")

func start_game():
	$StartScreen.queue_free()
	$StartPosition.position = Vector2(screen_size.x/4, screen_size.y/4)
	$Player.start($StartPosition.position)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
