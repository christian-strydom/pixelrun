extends KinematicBody2D

var GRAVITY = 10 
var JUMP_SPEED = -400
var velocity = Vector2.ZERO
var RunSpeed = 1

func _process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
	
	if is_on_floor():
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("jump")
	
	move_and_slide(velocity,Vector2.UP)

func end_game():
	get_tree().change_scene("res://TitleScreen/TitleScreen.tscn")


func _on_ObstacleTimer_timeout():
	RunSpeed *= Global.INCREASE_FACTOR
	GRAVITY *= Global.INCREASE_FACTOR
	JUMP_SPEED *= Global.INCREASE_FACTOR*1
	$AnimatedSprite.speed_scale = RunSpeed
