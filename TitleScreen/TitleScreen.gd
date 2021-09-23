extends Control

func _ready():
	if Global.score_time > Global.high_score:
		Global.high_score = Global.score_time
		
	$High_Score.text = "High Score: " + str(Global.high_score)
