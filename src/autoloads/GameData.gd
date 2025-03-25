extends Node

var areas = null
var current_area = null
var current_poi = null

# todo: rename to something like "initialize"
func initialize_from_json(file_path):
    areas = Utilities.load_json_data_as_dictionary(file_path)
    current_area = "alya's room"