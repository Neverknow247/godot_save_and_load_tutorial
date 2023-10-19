extends Node

var dev_mode = true

var save_slot

var new_save_data = {
	"save_name" : "New Save",
	"new_save" : true,
	"version" : 1,
	"power_on_count" : 0
}

var save_data = new_save_data.duplicate()
