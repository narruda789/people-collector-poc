extends Node

var _data_path = "res://data/"
var _area_data_file_path = _data_path + "areas.json"

var areas = null
var current_map = null
var current_area = null
var current_poi = null
var next_text = []

func initialize():
    initialize_from_json(_area_data_file_path)

func initialize_from_json(file_path = null):
    areas = Utilities.load_json_data_as_dictionary(file_path)

    current_area = areas["initial area"]
    current_map = areas[current_area].map
    current_poi = null
    next_text = []