extends Node2D
@onready var bathdoor = $TvRoom/Area2D
@onready var axel = $Axel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	
	if bathdoor.overlaps_body(axel):
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("uid://dyl7so2ea0kr4")
	
