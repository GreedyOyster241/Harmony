extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var my_profile = {"loaded": false, "data": {}}
var my_friends = {"loaded": false, "data": {}}

# Called when the node enters the scene tree for the first time.
func _ready():
	_get_my_profile()

func _get_my_profile() -> void:
	var file = File.new()
	file.open("res://start_files/user.json", file.READ)
	var json = file.get_as_text()
	var json_result = JSON.parse(json).result
	file.close()
	
	my_profile['data'] = json_result.results[0]
	my_profile['loaded'] = true

func _get_my_friends() -> void:
	var file = File.new()
	file.open("res://start_files/users.json", file.READ)
	var json = file.get_as_text()
	var json_result = JSON.parse(json).result
	file.close()
	
	my_friends['data'] = json_result.results
	my_friends['loaded'] = true
