extends Area2D
var CloudSpeed = 1
var cloud_list = ["Cloud1","Cloud2","Cloud3","Cloud4"]

func _ready():
	randomize()
	var current_cloud = cloud_list[randi() % cloud_list.size()]
	$AnimatedSprite.animation = current_cloud

func _process(delta):
	position.x -= 50 * delta * CloudSpeed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

