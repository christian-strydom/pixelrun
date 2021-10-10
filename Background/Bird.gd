extends Area2D
var BirdSpeed = 1
var bird_list = ["Bird1","Bird2","Bird3","Bird4"]

func _ready():
	randomize()
	var current_bird = bird_list[randi() % bird_list.size()]
	$AnimatedSprite.animation = current_bird

func _process(delta):
	position.x -= 250 * delta * BirdSpeed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
