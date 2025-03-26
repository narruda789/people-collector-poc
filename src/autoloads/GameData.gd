extends Node

var _data_path = "res://data/"
var _area_data_file_path = _data_path + "areas.json"
var _stats_data_file_path = _data_path + "stats.json"

# AREAS
var areas = null
var current_map = null
var current_area = null
var current_poi = null
var next_text = []

# STATS
var stats = null

func initialize():
	_initialize_areas()
	_initialize_stats()

func _initialize_areas():
	areas = Utilities.load_json_data_as_dictionary(_area_data_file_path)

	current_area = areas["initial area"]
	current_map = areas[current_area].map
	current_poi = null
	next_text = []

func _initialize_stats():
	stats = Utilities.load_json_data_as_dictionary(_stats_data_file_path)