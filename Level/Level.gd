extends Node
var RunSpeed = 1

const OBSTACLE = preload("res://Obstacles/Obstacle.tscn")
const CLOUD = preload("res://Background/Cloud.tscn")
const TREE = preload("res://Background/Tree.tscn")
const MOUNTAIN = preload("res://Background/Mountain.tscn")
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
	cloud.CloudSpeed = RunSpeed
	
	var scaleFactor = rng.randf_range(0.5,0.7)
	cloud.scale.y = scaleFactor
	cloud.scale.x = scaleFactor
	
	$CloudTimer.wait_time = rng.randf_range(2, 7)
	$CloudTimer.start()

func _on_TreeTimer_timeout():
	var tree = TREE.instance()
	add_child(tree)
	rng.randomize()
	tree.TreeSpeed = RunSpeed
	
	var scaleFactor = rng.randf_range(0.3,0.5)
	tree.scale.y = scaleFactor
	tree.scale.x = scaleFactor
	tree.position.y += (1-scaleFactor)*170
	
	$TreeTimer.wait_time = rng.randf_range(0.8, 3)
	$TreeTimer.start()


func _on_MountainTimer_timeout():
	var mountain = MOUNTAIN.instance()
	add_child(mountain)
	rng.randomize()
	mountain.MountainSpeed = RunSpeed
	
	var scaleFactor = rng.randf_range(0.4,0.7)
	mountain.scale.y = scaleFactor
	mountain.scale.x = scaleFactor
	mountain.position.y += (1-scaleFactor)*200
	
	$MountainTimer.wait_time = rng.randf_range(3, 8)
	$MountainTimer.start()
