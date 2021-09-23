extends Area2D
var CloudSpeed = 1

#func _ready():

func _process(delta):
	position.x -= 100 * delta * CloudSpeed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

