extends Area2D
var MonsterSpeed = 1
var obstacle_list = ["bad_requirements","budget","context_switching","deadlines","limited_resources","no_planning","no_unit_tests","scope_creep"]


func _ready():
	randomize()
	var current_obstacle = obstacle_list[randi() % obstacle_list.size()]
	$AnimatedSprite.animation = current_obstacle

func _process(delta):
	position.x -= 500 * delta * MonsterSpeed

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Obstacle_body_entered(body):
	get_tree().call_group("Player","end_game")
