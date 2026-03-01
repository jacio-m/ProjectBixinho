extends Node

func _ready():
	$AnimatedSprite2D.play("StandPose")
	$AnimationPlayer.play("Bounce")
