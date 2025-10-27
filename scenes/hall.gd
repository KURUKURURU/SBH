extends Node2D
@onready var t_Anim = $text_default_window/Node2D/Text/Text_Ratio_Animation
@onready var t_Text = $text_default_window/Node2D/Text
@onready var t_Placement = $text_default_window/Node2D/Text/Window_Placement
var hover : bool

func _process(delta: float) -> void:
		
	if !hover:
		$Label/Text.text = ""


func _on_right_pressed() -> void:
	get_tree().change_scene_to_file("uid://csja4fq7an5o5")

func _ready() -> void:
	$Label.show()
	$text_default_window.hide()
	
	if Global.start_alarm:
		$Alarm_noise.play()
	if Global.hall_text:
		alignWindow("Left")
		text("I had to first get my daughter and I ready for 
		the day.", "Small", 3.0)
		Global.hall_text = false

func alignWindow(position: String) -> void: #Center, Left, Right
	match position:
		"Left":
			t_Placement.play("Text_Window_Placement/Left")
			
		"Center":
			t_Placement.play("Text_Window_Placement/Center")
			
		"Right":
			t_Placement.play("Text_Window_Placement/Right")	

func text(maintext: String, mode: String, seconds: float) -> void: #Actual text, how long animation, and reading time
	var num = seconds
	$text_default_window.hide()
	t_Text.visible_ratio = 0
	t_Text.text = maintext
	
	
	await get_tree().process_frame
	
	$text_default_window.show()
	
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
	$text_default_window.hide()
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


func _on_right_mouse_entered() -> void:
	hover = true
	$Label/Text.text = "my bedroom"


func _on_right_mouse_exited() -> void:
	hover = false


func joRoom_enter() -> void:
	hover = true
	$Label/Text.text = "jo's bedroom"

func joRoon_exit() -> void:
	hover = false


func PressJoROOM() -> void:
	if Global.dressed_day:
		get_tree().change_scene_to_file("uid://dbk4qpe5lo4p6")
	elif !Global.dressed_day:
		alignWindow("Left")
		text("I should get dressed before waking Jo.", "Small", 3.0)
