extends Node

var areas = null
var current_map = null
var current_area = null
var current_poi = null

func initialize_from_json(file_path = null):
    areas = Utilities.load_json_data_as_dictionary(file_path)

    current_area = areas["initial area"]
    current_map = areas[current_area].map
    current_poi = null