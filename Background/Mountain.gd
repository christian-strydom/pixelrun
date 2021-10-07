extends Area2D
var MountainSpeed = 1
var mountain_list = ["Mountain1","Mountain2","Mountain3","Mountain4"]

func _ready():
	randomize()
	var current_mountain = mountain_list[randi() % mountain_list.size()]
	$AnimatedSprite.animation = current_mountain

func _process(delta):
	position.x -= 200 * delta * MountainSpeed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
