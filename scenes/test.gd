extends Node2D
@onready var t_Anim = $text_default_window/Node2D/Text/Text_Ratio_Animation
@onready var t_Text = $text_default_window/Node2D/Text
@onready var t_Placement = $text_default_window/Node2D/Text/Window_Placement

@onready var Ax_emote = $emote_window/Node/Axel
@onready var e_Placement = $emote_window/AnimationPlayer

@onready var shuffle = $JukeBox/SFX/Movement/Shuffle
@onready var sigh = $JukeBox/SFX/Movement/Sigh
@onready var car = $JukeBox/SFX/Car
@onready var vhs_start = $JukeBox/SFX/VHS_start
@onready var one = $JukeBox/Music/ScaryAmbient
@onready var two = $JukeBox/Music/SmallPiano
@onready var three = $JukeBox/SFX/Wind


#var num2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.code = "intro_done"
	
	# RESET EMOTES
	$emote_window/Node/Axel.hide()
	$emote_window/Node/Killer.hide()
	$CarScene.hide()
	$WhiteFADE.hide()
	
	
	three.play()
	one.play()
	
	resetText("hide_all")
	
	await wait(4.0)
	two.play()
	
	
	alignWindow("Left")
	emote("Axel","welp")
	$bing.play()
	await text("I'd like to know why.", "Medium", 4.0)
	
	alignWindow("Right")
	emote("Killer" ,"sad")
	await text("...", "Medium", 1.0)
	
	alignWindow("Right")
	emote("Killer" ,"sad")
	await text("'Why?'", "Small", 1.5)
	
	alignWindow("Right")
	emote("Killer" ,"sad")
	await text("Why I did it?", "Small", 3.0)
	
	shuffle.play()
	await wait(4.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("Well,", "Small", 2.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("you already have enough to put me away,", "Medium", 0.7)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("I don't think I have to stay here and entertain 
	your curiousity.", "Medium", 3.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("You're wasting your time.", "Medium", 3.0)
	
	alignWindow("Left")
	emote("Axel" ,"sad")
	await text("I don't think I am.", "Small", 2.0)
	
	alignWindow("Left")
	emote("Axel" ,"sad")
	await text("I don't think you're a waste of time.", "Small", 2.0)
	
	resetText("hide_all")
	shuffle.play()
	await wait(5.0)
	
	alignWindow("Right")
	emote("Killer" ,"smile")
	await text("Alright.", "Small", 2.0)
	
	alignWindow("Right")
	emote("Killer" ,"smile")
	await text("But I won't be the only one talking.", "Small", 2.0)
	
	alignWindow("Left")
	emote("Axel" ,"welp")
	await text("...", "Medium", 2.0)
	
	alignWindow("Right")
	emote("Killer" ,"sad")
	await text("All you have to do is say how you found it was me.", "Medium", 2.0)
	
	alignWindow("Right")
	emote("Killer" ,"smile")
	await text("Then, I'll tell you my story. And we'll take turns.", "Medium", 2.0)
	
	resetText("hide_all")
	await wait(3.0)
	
	alignWindow("Left")
	emote("Axel" ,"sad")
	await text("Why would you even want to know that?", "Small", 2.0)
	
	resetText("hide_all")
	await wait(1.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("Why would you want to know about me?", "Small", 2.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("I guess we're both curious.", "Small", 2.0)
	
	resetText("hide_all")
	
	sigh.play()
	await wait(2.0)
	
	
	#Transition to car scene
	
	
	$CarScene.modulate.a = 0.0
	
	$CarScene.show()
	$CarScene/Fade.play("Fade_IN")
	car.play()
	
	alignWindow("Left")
	emote("Axel" ,"sad")
	#sigh.play()
	await text("", "Small", 2.0)
	
	# finish transition  crime scene, I had-
	
	
	alignWindow("Left")
	emote("Axel" ,"sad")
	await text("When I drove up to your,", "Small", 1.0)
	
	alignWindow("Left")
	emote("Axel" ,"sad")
	await text("excuse me, the crime scene, I had-", "Small", 0.2)
	
	car.stop()
	$CarScene.hide()
	
	alignWindow("Right")
	emote("Killer" ,"sad")
	await text("No.", "Small", 4.0)
	
	alignWindow("Left")
	emote("Axel" ,"sad")
	await text("What?", "Small", 2.0)
	
	alignWindow("Right")
	emote("Killer" ,"sad")
	await text("Your morning?", "Small", 1.0)
	
	alignWindow("Right")
	emote("Killer" ,"sad")
	await text("Family?", "Small", 2.0)
	
	alignWindow("Left")
	emote("Axel" ,"welp")
	await text("I don't feel comfortable sharing that, thanks.", "Medium", 2.0)
	
	resetText("hide_all")
	await wait(2.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("I'll be in a prison, a cage, soon.", "Small", 3.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("I can't do anything with what you tell me.", "Small", 3.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("I'm powerless.", "Small", 3.0)
	
	alignWindow("Left")
	emote("Axel" ,"welp")
	await text("Glad you know that.", "Medium", 2.0)
	
	resetText("hide")
	await wait(2.0)
	
	alignWindow("Right")
	emote("Killer" ,"welp")
	await text("I'm not saying a word until you do.", "Small", 3.0)
	
	sigh.play()
	await wait(1.0)
	
	$WhiteFADE.show()
	$WhiteFADE/Fade.play("RESET")
	$WhiteFADE/Fade.play("Fade_IN")
	vhs_start.play()
	await wait(13.74)
	
	get_tree().change_scene_to_file("uid://cob825eimiql2")
	
func emote(name: String, emote: String) -> void: 
	#Ax_emote.play("hold")
	var character
	
	$emote_window/Node/Killer.hide()
	$emote_window/Node/Axel.hide()
	
	await get_tree().process_frame
	match name:
		"Axel":
			
			$emote_window/Node/Axel.show()
			character = $emote_window/Node/Axel
			
		"Killer":
			
			$emote_window/Node/Killer.show()
			character = $emote_window/Node/Axel
			
		#"Jo": # FILL IN WITH MORE CHARACTERS
			#Ax_emote.play("sad")
		#"Sandy":
			#Ax_emote.play("smile")
	
	match emote:
		"hold":
			character.play("hold")
		"welp":
			character.play("welp")
		"sad":
			character.play("sad")
		"smile":
			character.play("smile")
	return

func _process(delta: float) -> void:
	pass

func alignWindow(position: String) -> void: #Center, Left, Right
	match position:
		"Left":
			t_Placement.play("Text_Window_Placement/Left")
			e_Placement.play("Placement/Left")
		"Center":
			t_Placement.play("Text_Window_Placement/Center")
			e_Placement.play("Placement/Center")
		"Right":
			t_Placement.play("Text_Window_Placement/Right")
			e_Placement.play("Placement/Right")

func text(maintext: String, mode: String, seconds: float) -> void: #Actual text, how long animation, and reading time
	var num = seconds
	$text_default_window.hide()
	t_Text.visible_ratio = 0
	t_Text.text = maintext
	
	
	await get_tree().process_frame
	
	$text_default_window.show()
	$emote_window.show()
	
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
	print(seconds)
	
	$text_default_window/Node2D/clicker.show()
	$text_default_window/Node2D/clicker/AnimationPlayer.play("in")

	#await wait(1.0)
	await press_click()
	
	$text_default_window/Node2D/clicker/AnimationPlayer.play("RESET")
	$text_default_window/Node2D/clicker.hide()
	return
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func resetText(Visible: String):
	
	match Visible:
		"hide":
			$text_default_window.hide()
			t_Text.text = ""
		"hide_all":
			$text_default_window.hide()
			$emote_window.hide()
			t_Text.text = ""
		"show":
			t_Text.text = ""
	
	#t_Text.text = ""
	return

func press_click():
	while true:
		await get_tree().process_frame
		if Input.is_action_just_pressed("click"): # default Space/Enter
			break


func _on_right_pressed() -> void:
	get_tree().change_scene_to_file("uid://csja4fq7an5o5")
