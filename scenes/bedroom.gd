extends Node2D
var hover : bool

func _process(delta: float) -> void:
	if !hover:
		$Label/Text.text = ""
	if Global.dressed_day:
		$ClosetPanel/Mirror.texture = load("uid://cnau2xc14xod8")
	if !Global.dressed_day:
		$ClosetPanel/Mirror.texture = load("uid://nhawjwvn2hca")

func _ready() -> void:
	$ClosetPanel.hide()
	
	if !Sound.Music_1.is_playing():
		Sound.Music_1.play()
	
	if Global.start_alarm:
		$Alarm/noise.play()

func _on_right_pressed() -> void:
	hover = false
	get_tree().change_scene_to_file("uid://ddpssu5uudwxq")


func _on_alarm_pressed() -> void:
	$Alarm/noise.stop()
	Global.start_alarm = false


func _on_alarm_mouse_entered() -> void:
	hover = true
	if $Alarm/noise.is_playing():
		$Label/Text.text = "turn off"
	elif !$Alarm/noise.is_playing():
		$Label/Text.text = "a clock"


func _on_alarm_mouse_exited() -> void:
	hover = false


func right_hover() -> void:
	hover = true
	$Label/Text.text = "hallway"


func right_hover_end() -> void:
	hover = false


func closettouch() -> void:
	hover = true
	$Label/Text.text = "closet"


func _on_closet_mask_mouse_exited() -> void:
	hover = false


func _on_closet_mask_pressed() -> void:
	$ClosetPanel.show()


func _on_back_pressed() -> void:
	$ClosetPanel.hide()


func _on_back_mouse_entered() -> void:
	hover = true
	$Label/Text.text = "back"


func _on_back_mouse_exited() -> void:
	hover = false


func _on_dress_button_mouse_entered() -> void:
	hover = true
	if !Global.dressed_day:
		$Label/Text.text = "get dressed"
	elif Global.dressed_day:
		$Label/Text.text = ""


func _on_dress_button_pressed() -> void:
	if !Global.dressed_day:
		$ClosetPanel/dressedNoise.play()
		Global.dressed_day = true


func _on_dress_button_mouse_exited() -> void:
	hover = false
