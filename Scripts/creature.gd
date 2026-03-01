extends Node
class_name Creature

@export var health = 0
@export var alive = true
@export var type = ""
@export var type2 = ""
@export var health_bar : ProgressBar

func _ready():
	health_bar.max_value = health
	health_bar.value = health
	$Sprite.play("StandPose")
	$Animation.play("Bounce")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		take_damage("Salty", 10)

func take_damage(damage_type, damage_val):
	if damage_type == "Salty" and (self.type == "Hot" or self.type == "Citric"):
		damage_val *= 2
	elif damage_type == "Salty" and (self.type == "Spicy" or self.type == "Solid"):
		damage_val *= 0.5
	elif damage_type == "Salty" and (self.type == "Salty"):
		damage_val = 0

	if damage_type == "Hot" and (self.type == "Fruit" or self.type == "Cold"):
		damage_val *= 2
	elif damage_type == "Hot" and (self.type == "Liquid" or self.type == "Salty"):
		damage_val *= 0.5
	elif damage_type == "Hot" and (self.type == "Hot"):
		damage_val = 0
	
	if damage_type == "Liquid" and (self.type == "Hot" or self.type == "Solid"):
		damage_val *= 2
	elif damage_type == "Liquid" and (self.type == "Fruit" or self.type == "Citric"):
		damage_val *= 0.5
	elif damage_type == "Liquid" and (self.type == "Liquid"):
		damage_val = 0
	
	if damage_type == "Fruit" and (self.type == "Liquid" or self.type == "Sweet"):
		damage_val *= 2
	elif damage_type == "Fruit" and (self.type == "Hot" or self.type == "Cold"):
		damage_val *= 0.5
	elif damage_type == "Fruit" and (self.type == "Fruit"):
		damage_val = 0
	
	if damage_type == "Salty" and (self.type == "Hot" or self.type == "Citric"):
		damage_val *= 2
	elif damage_type == "Salty" and (self.type == "Spicy" or self.type == "Solid"):
		damage_val *= 0.5
	elif damage_type == "Salty" and (self.type == "Salty"):
		damage_val = 0
	
	health -= damage_val
	health_bar.value = health
	if health < 0:
		alive = false
