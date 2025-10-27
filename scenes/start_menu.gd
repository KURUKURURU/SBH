extends Node2D
#@onready var label = $Label/Text
var hover

func _ready() -> void:
	Global.code = "menu"
	
func _process(delta: float) -> void:
	if hover:
		$Label.show()
	elif !hover:
		$Label.hide()
		
	if $SettingsPanel.visible:
		if !$MusicTest.is_playing():
			$MusicTest.play()
		if !$SFXTest.is_playing():
			$SFXTest.play()
	else:
		$MusicTest.stop()
		$SFXTest.stop()

func _on_notebook_pressed() -> void:
	$Notebook/Paper.play()

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout


func _on_case_mask_pressed() -> void:
	$CaseMask.hide()
	
	$BriefcaseTexture/AnimationPlayer.play("case/open")
	await $BriefcaseTexture/AnimationPlayer.animation_finished
	$BriefcaseTexture/CaseClick.play()
	$Notebook.show()
	$Settings.show()
	


func _on_case_mask_mouse_entered() -> void:
	hover = true
	$Label/Text.text = "open"
	
func _on_case_mask_mouse_exited() -> void:
	hover = false


func _on_notebook_mouse_entered() -> void:
	hover = true
	$Label/Text.text = "start game"

func _on_notebook_mouse_exited() -> void:
	hover = false


func _on_paper_finished() -> void:
	get_tree().change_scene_to_file("uid://cob825eimiql2")


func _on_settings_pressed() -> void:
	$SettingsPanel.show()
	$Settings/Bing.play()


func _on_settings_mouse_entered() -> void:
	hover = true
	$Label/Text.text = "settings"


func _on_settings_mouse_exited() -> void:
	hover = false


func _on_exit_pressed() -> void:
	$SettingsPanel.hide()
