extends Node
class_name Creature

@export var health = 0
@export var alive = true
@export var type = "Type Name"
@export var type2 = "Type Name 2"
@export var health_bar : ProgressBar

func _ready():
	health_bar.max_value = health
	health_bar.value = health
	$Sprite.play("StandPose")
	$Animation.play("Bounce")
