extends Node2D
@onready var fadeA = $wakeup/fadeanim
@onready var wakeup = $wakeup

@onready var t_Anim = $CanvasLayer/text_default_window/Node2D/Text/Text_Ratio_Animation
@onready var t_Text = $CanvasLayer/text_default_window/Node2D/Text
@onready var interactA = $CanvasLayer/interact/AnimationPlayer
@onready var interact = $CanvasLayer/interact

@onready var axel = $Axel
@onready var bathdoor = $Furniture/Doors/Bathroom/Area2D
@onready var jodoor = $Furniture/Doors/JoRoom/Area2D

@onready var t_Placement = $CanvasLayer/text_default_window/Node2D/Text/Window_Placement
#@onready var e_Placement = $emote_window/AnimationPlayer

@onready var shuffle = $JukeBox/SFX/Movement/Shuffle
@onready var sigh = $JukeBox/SFX/Movement/Sigh
@onready var car = $JukeBox/SFX/Car
@onready var vhs_start = $JukeBox/SFX/VHS_start
@onready var objective = $JukeBox/SFX/Click
@onready var morning = $JukeBox/Music/CalmMorningMusic
@onready var wind = $JukeBox/SFX/Wind

@onready var default_scene_node = self
var new_scene_instance


var done = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#$emote_window/Node/Axel.hide()
	#$emote_window/Node/Killer.hide()
	$CanvasLayer/text_default_window.hide()
	
	#I want to make the white fade in, then the 1 and then the 2 and only after
	#the 2 will you be able to press space
	
	wakeup.show()
	fadeA.play("FadeInFull")
	await fadeA.animation_finished
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space") and !done:
		done = true
		morning.play()
		wind.play()
		
		wakeup.hide()
		await wait(2.0)
		
		alignWindow("Left")
		#emote("Axel","welp")
		objective.play()
		await text("That morning I had to take my daughter to school early.", "Medium", 2.0)
		$CanvasLayer/text_default_window.hide()
		
		await wait(3.0)
		
		interact.show()
		interact.modulate.a = 0
		interactA.play("fade")
		await interactA.animation_finished
		interact.hide()
		
		
		#I want thetext box to show up with the new text but with a noise suggesting
		#a quest or new objective
	
func _physics_process(delta):
	if bathdoor.overlaps_body(axel):
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("uid://daj3hpg45rk0h")
	if jodoor.overlaps_body(axel):
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("uid://daj3hpg45rk0h")
		
func alignWindow(position: String) -> void: #Center, Left, Right
	match position:
		"Left":
			t_Placement.play("Text_Window_Placement/Left")
			#e_Placement.play("Placement/Left")
		"Center":
			t_Placement.play("Text_Window_Placement/Center")
			#e_Placement.play("Placement/Center")
		"Right":
			t_Placement.play("Text_Window_Placement/Right")
			#e_Placement.play("Placement/Right")

func text(maintext: String, mode: String, seconds: float) -> void: #Actual text, how long animation, and reading time
	var num = seconds
	$CanvasLayer/text_default_window.hide()
	t_Text.visible_ratio = 0
	t_Text.text = maintext
	
	await get_tree().process_frame
	
	$CanvasLayer/text_default_window.show()
	#$emote_window.show()
	
	match mode:
		"Small":
			t_Anim.play("Modes/Small")
		"Medium":
			t_Anim.play("Modes/Medium")
		"Large":
			t_Anim.play("Modes/Large")
		"Huge":
			t_Anim.play("Modes/HUGE")
	await t_Anim.animation_finished
	await get_tree().create_timer(num).timeout
	
	return

#func emote(name: String, emote: String) -> void: 
	##Ax_emote.play("hold")
	#var character
	#
	#$emote_window/Node/Killer.hide()
	#$emote_window/Node/Axel.hide()
	#
	#await get_tree().process_frame
	#match name:
		#"Axel":
			#
			#$emote_window/Node/Axel.show()
			#character = $emote_window/Node/Axel
			#
		#"Killer":
			#
			#$emote_window/Node/Killer.show()
			#character = $emote_window/Node/Axel
			#
		##"Jo": # FILL IN WITH MORE CHARACTERS
			##Ax_emote.play("sad")
		##"Sandy":
			##Ax_emote.play("smile")
	#
	#match emote:
		#"hold":
			#character.play("hold")
		#"welp":
			#character.play("welp")
		#"sad":
			#character.play("sad")
		#"smile":
			#character.play("smile")
	#return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout


#func open_new_scene():
	#get_tree().paused = true  # pause the old scene
#
	#var new_scene = preload("uid://b1p8cinlmeh6y").instantiate()
	#
#
	#var layer = CanvasLayer.new()
	#layer.add_child(new_scene)
	#add_child(layer)
#
	## Optional: let the new scene run until it emits a signal to exit
	## But for now, we just wait a bit to simulate time spent inside it
	#await wait(3.0)
#
	## Remove the new scene cleanly
	#layer.queue_free()
#
	#get_tree().paused = false
	
