extends Area2D
signal hit

# Declare member variables here. Examples:
export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.


# The _ready() function is called when a node enters the scene tree,
# which is a good time to find the size of the game window:
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		var velocity = Vector2()  # The player's movement vector.
		if Input.is_action_pressed("ui_right"):
				velocity.x += 1
		if Input.is_action_pressed("ui_left"):
				velocity.x -= 1
		if Input.is_action_pressed("ui_down"):
				velocity.y += 1
		if Input.is_action_pressed("ui_up"):
				velocity.y -= 1
		if velocity.length() > 0:
				velocity = velocity.normalized() * speed
				$AnimatedSprite.play()
		else:
				$AnimatedSprite.stop()
				
		# We can also use clamp() to prevent player from leaving the screen		
		position += velocity * delta
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)

		# Choosing animations
		if velocity.x != 0:
			$AnimatedSprite.animation = "walk"
			$AnimatedSprite.flip_v = false
			$AnimatedSprite.flip_h = velocity.x < 0
		elif velocity.y != 0:
			$AnimatedSprite.animation = "up"
			$AnimatedSprite.flip_v = velocity.y > 0


func _on_Player_body_entered(body):
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
