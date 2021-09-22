extends Node
var RunSpeed = 1

const OBSTACLE = preload("res://Obstacles/Obstacle.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	Global.score_time = 0

func _on_Timer_timeout():
	var obstacle = OBSTACLE.instance()
	RunSpeed *= 1.005
	obstacle.MonsterSpeed = RunSpeed
	add_child(obstacle)

	rng.randomize()
	$Timer.wait_time = rng.randf_range(1.2, 2.0)
	$Timer.start()

func _process(delta):
	$Label.text = "Score:" + str(Global.score_time)

func _on_ScoreTimer_timeout():
	Global.score_time += 1
