extends CharacterBody2D

@onready var Axel_animation = $AnimatedSprite2D

@export var speed = 100
@export var shift = 1.0

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_pressed("shift"):
		speed = 150
	else: 
		speed = 100
		
		
	speed = speed * shift
	velocity = input_direction * speed 
	
	if velocity.length() != 0:
		if input_direction.x < 0:
			Axel_animation.play("down")
			
		if input_direction.x > 0:
			Axel_animation.play("down")
			
		if input_direction.y < 0:
			Axel_animation.play("down")
			
		if input_direction.y > 0:
			Axel_animation.play("down")
		
	elif velocity.length() == 0:
		Axel_animation.stop()

func _physics_process(delta):
	get_input()
	move_and_slide()
	
