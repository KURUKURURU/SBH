extends Node2D
var hover : bool

func _process(delta: float) -> void:
	
	
	if !Global.JoAwake:
		$Jo/JoWake.show()
	elif Global.JoAwake:
		$Jo/JoWake.hide()	
		$Jo/JoDressed.show()
	
	if !hover:
		$Label/Text.text = ""


func _on_hallway_mouse_entered() -> void:
	hover = true
	$Label/Text.text = "hallway"


func _on_hallway_mouse_exited() -> void:
	hover = false


func _on_hallway_pressed() -> void:
	get_tree().change_scene_to_file("uid://ddpssu5uudwxq")


func _on_closet_mouse_entered() -> void:
	hover = true
	if Global.JoAwake:
		if Global.JoDressed:
			$Label/Text.text = "jo is already dressed"
		elif !Global.JoDressed:	
			$Label/Text.text = "get Jo dressed"
			
	elif !Global.JoAwake:
		$Label/Text.text = "I should wake Jo to dress her"

func _on_closet_mouse_exited() -> void:
	hover = false


func _on_jo_wake_mouse_entered() -> void:
	hover = true
	$Label/Text.text = "wake Jo up"


func _on_jo_wake_mouse_exited() -> void:
	hover = false


func _on_jo_wake_pressed() -> void:
	Global.JoAwake = true


func _on_closet_pressed() -> void:
	if !Global.JoDressed:
			Global.JoDressed = true


func _on_jo_dressed_mouse_entered() -> void:
	pass # Replace with CRAP TO DO!!!!
