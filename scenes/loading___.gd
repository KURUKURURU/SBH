extends Node2D

func _ready() -> void:
	await get_tree().create_timer(3.5).timeout
	
	if Global.code == "menu":
		get_tree().change_scene_to_file("uid://dyiqdpj7qm6xo")
	elif Global.code == "intro_done":
		get_tree().change_scene_to_file("uid://csja4fq7an5o5")
