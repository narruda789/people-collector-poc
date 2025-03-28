extends Node

var _data_path = "res://data/"
var _area_data_file_path = _data_path + "areas.json"
var _stats_data_file_path = _data_path + "stats.json"

# AREAS
var areas = null
var current_map = null
var current_area = null
var current_poi = null

# STATS
var stats = {
	"party" : StatBlock.new(0, 0, 0, 0).get_stats()
}

# INTERNAL
var next_text = []
var auto_commands = []

func initialize():
	_initialize_areas()
	_initialize_stats()

# todo: abstract out stat manipulation?
func update_party_stat(stat, value_to_add):
	stats["party"][stat] += value_to_add
	if stats["party"][stat] > 5:
		stats["party"][stat] = 5
	elif stats["party"][stat] < 0:
		stats["party"][stat] = 0

func _initialize_areas():
	areas = Utilities.load_json_data_as_dictionary(_area_data_file_path)

	current_area = areas["initial area"]
	current_map = areas[current_area].map
	current_poi = null
	next_text = []

func _initialize_stats():
	stats = Utilities.load_json_data_as_dictionary(_stats_data_file_path)