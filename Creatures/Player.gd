extends Node

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = $Human.get_viewport_rect().size
	$Human/AnimatedSprite.stop()
	$Human.hide()
	$Camera2D.current = false

func start(position):
	$Human.position = position
	$Human.show()
	$Camera2D.current = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_sprite(delta)

func move_sprite(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * $Human.speed
		$Human/AnimatedSprite.play()
		$Human.position += velocity * delta
		$Human.position.x = clamp($Human.position.x, 0, screen_size.x)
		$Human.position.y = clamp($Human.position.y, 0, screen_size.y)
		if velocity.x != 0:
			$Human/AnimatedSprite.animation = "left"
			$Human/AnimatedSprite.flip_v = false
			$Human/AnimatedSprite.flip_h = velocity.x > 0
		elif velocity.y < 0:
			$Human/AnimatedSprite.animation = "up"
			$Human/AnimatedSprite.flip_h = false
			$Human/AnimatedSprite.flip_v = false
		elif velocity.y > 0:
			$Human/AnimatedSprite.animation = "down"
			$Human/AnimatedSprite.flip_h = false
			$Human/AnimatedSprite.flip_v = false
	else:
		$Human/AnimatedSprite.stop()
