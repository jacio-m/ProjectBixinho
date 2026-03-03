extends Node
class_name Creature

@export var nickname = ""
@export var health = 0
@export var alive = true
@export var type = ""
@export var type2 = ""
@export var type3 = ""
@export var health_bar : TextureProgressBar
@export var health_bar_num : Label

func _ready():
	health_bar.max_value = health
	health_bar.value = health
	health_bar_num.text = str(health)
	$Sprite.play("StandPose")
	$Animation.play("Bounce")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		take_damage("Salty", 100)

func take_damage(damage_type, damage_val):
	var tween = get_tree().create_tween()
	if alive == false:
		return
	else:
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
		
		if damage_type == "Citric" and (self.type == "Liquid" or self.type == "Spicy"):
			damage_val *= 2
		elif damage_type == "Citric" and (self.type == "Salty" or self.type == "Sweet"):
			damage_val *= 0.5
		elif damage_type == "Citric" and (self.type == "Citric"):
			damage_val = 0
		
		if damage_type == "Cold" and (self.type == "Fruit" or self.type == "Solid"):
			damage_val *= 2
		elif damage_type == "Cold" and (self.type == "Hot" or self.type == "Spicy"):
			damage_val *= 0.5
		elif damage_type == "Cold" and (self.type == "Cold"):
			damage_val = 0
			
		if damage_type == "Spicy" and (self.type == "Salty" or self.type == "Cold"):
			damage_val *= 2
		elif damage_type == "Spicy" and (self.type == "Citric" or self.type == "Bitter"):
			damage_val *= 0.5
		elif damage_type == "Spicy" and (self.type == "Spicy"):
			damage_val = 0
		
		if damage_type == "Bitter" and (self.type == "Spicy" or self.type == "Sweet"):
			damage_val *= 2
		elif damage_type == "Bitter" and (self.type == "Solid"):
			damage_val *= 0.5
		elif damage_type == "Bitter" and (self.type == "Bitter"):
			damage_val = 0
		
		if damage_type == "Sweet" and (self.type == "Citric" or self.type == "Bitter"):
			damage_val *= 2
		elif damage_type == "Sweet" and (self.type == "Fruit"):
			damage_val *= 0.5
		elif damage_type == "Sweet" and (self.type == "Sweet"):
			damage_val = 0
			
		if damage_type == "Solid" and (self.type == "Salty" or self.type == "Bitter"):
			damage_val *= 2
		elif damage_type == "Solid" and (self.type == "Liquid" or self.type == "Cold"):
			damage_val *= 0.5
		elif damage_type == "Solid" and (self.type == "Solid"):
			damage_val = 0
			
		health -= damage_val
		tween.tween_property(health_bar,"value",health,0.2)
		health_bar_num.text = str(health)
	if health <= 0:
		alive = false
