extends Area2D
var TreeSpeed = 1
var tree_list = ["Tree1","Tree2","Tree3","Tree4"]

func _ready():
	randomize()
	var current_tree = tree_list[randi() % tree_list.size()]
	$AnimatedSprite.animation = current_tree

func _process(delta):
	position.x -= 300 * delta * TreeSpeed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
