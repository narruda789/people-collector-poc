extends Node

var areas = null
var current_map = null
var current_area = null
var current_poi = null

func initialize_from_json(file_path):
    areas = Utilities.load_json_data_as_dictionary(file_path)
    current_map = "alya's house"
    current_area = "alya's room"
    current_poi = null