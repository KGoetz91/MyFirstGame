extends CanvasLayer

signal start

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.connect("pressed",self, "_on_Button_pressed")

func _on_Button_pressed():
	emit_signal("start")
