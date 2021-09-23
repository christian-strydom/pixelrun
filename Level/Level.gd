extends Node
var RunSpeed = 1

const OBSTACLE = preload("res://Obstacles/Obstacle.tscn")
const CLOUD = preload("res://Background/Cloud.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	Global.score_time = 0

func _on_Timer_timeout():
	var obstacle = OBSTACLE.instance()
	RunSpeed *= 1.005
	obstacle.MonsterSpeed = RunSpeed
	add_child(obstacle)

	rng.randomize()
	$Timer.wait_time = rng.randf_range(1.4, 2.6)
	$Timer.start()

func _process(delta):
	$Label.text = "Score:" + str(Global.score_time)

func _on_ScoreTimer_timeout():
	Global.score_time += 1

func _on_CloudTimer_timeout():
	var cloud = CLOUD.instance()
	add_child(cloud)
	rng.randomize()
	cloud.position.y = rng.randf_range(50,350)
	
	$CloudTimer.wait_time = rng.randf_range(2, 7)
	$CloudTimer.start()
