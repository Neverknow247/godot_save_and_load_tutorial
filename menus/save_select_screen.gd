extends Control

var stats = Stats
var save_and_load = SaveAndLoad

@onready var save_one = $CenterContainer/HBoxContainer/save_one
@onready var save_two = $CenterContainer/HBoxContainer/save_two
@onready var save_three = $CenterContainer/HBoxContainer/save_three

@onready var name_save = $name_save
@onready var save_name_edit = $name_save/CenterContainer/VBoxContainer/save_name_edit

var save_names = ["save_1","save_2","save_3"]
@onready var save_buttons = [save_one,save_two,save_three]

func _ready():
	update_buttons()

func update_buttons():
	for i in save_names.size():
		stats.save_slot = save_names[i]
		save_and_load.change_save_location()
		save_and_load.load_data()
		save_and_load.save_all()
		print(stats.save_data)
		save_buttons[i].text = stats.save_data["save_name"]

func load_game():
	save_and_load.change_save_location()
	save_and_load.load_data()
	if stats.save_data.new_save:
		name_save.visible = true
	else:
		stats.save_data.power_on_count += 1
		save_and_load.update_save_data()
		get_tree().change_scene_to_file("res://menus/main_menu.tscn")

func _on_save_one_pressed():
	stats.save_slot = save_names[0]
	load_game()

func _on_save_two_pressed():
	stats.save_slot = save_names[1]
	load_game()

func _on_save_three_pressed():
	stats.save_slot = save_names[2]
	load_game()

func _on_enter_name_button_pressed():
	stats.save_data.save_name = save_name_edit.text
	stats.save_data.new_save = false
	stats.save_data.power_on_count += 1
	save_and_load.update_save_data()
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")
