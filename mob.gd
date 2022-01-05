extends RigidBody2D


# Declare member variables here. Examples:
export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.


# Called when the node enters the scene tree for the first time.
# You must use randomize() if you want your sequence of "random" numbers to be different every time you run the scene. 
func _ready():
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	$AnimatedSprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
