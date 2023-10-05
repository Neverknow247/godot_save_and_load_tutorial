extends Control

var stats = Stats

@onready var save_name_label = $save_name_label

func _ready():
	SaveAndLoad.update_save_data()
	save_name_label.text = stats.save_data.save_name

func _on_button_pressed():
	get_tree().change_scene_to_file("res://menus/volume_menu.tscn")

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://menus/save_select_screen.tscn")
