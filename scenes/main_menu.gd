class_name MainMenu
extends Control

@onready var start_button = $Actions/Buttons/Start
@onready var exit_button = $Actions/Buttons/Exit
@onready var main_scene = preload("res://scenes/main.tscn")

func _ready():
	start_button.button_down.connect(on_start)
	exit_button.button_down.connect(on_exit)

func on_start():
	get_tree().change_scene_to_packed(main_scene)
	
func on_exit():
	get_tree().quit()
