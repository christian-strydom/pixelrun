extends Area2D
var MonsterSpeed = 1
var Obstacle = "scope_creep"

func _ready():
	$AnimatedSprite.animation = Obstacle

func _process(delta):
	position.x -= 500 * delta * MonsterSpeed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Obstacle_body_entered(body):
	get_tree().call_group("Player","end_game")
