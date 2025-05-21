extends Node

var HOST = "127.0.0.1"
var PORT = 7350
var SCHEME = "http"
var SERVER_KEY = "defaultkey"

func _ready():
	var f = File.new()
	if f.open("res://settings.json", File.READ) != OK:
		return
	var test_json_conv = JSON.new()
	test_json_conv.parse(f.get_as_text())
	var json = test_json_conv.get_data()
	if json.error != OK or typeof(json.result) != TYPE_DICTIONARY:
		return
	var d = json.result
	for k in d:
		match k:
			"HOST": HOST = d[k]
			"PORT": PORT = d[k]
			"SCHEME": SCHEME = d[k]
			"SERVER_KEY": SERVER_KEY = d[k]
