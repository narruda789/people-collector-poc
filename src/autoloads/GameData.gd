extends Node

var _game_data = null
var _current_area = null
var _current_poi = null

# todo: rename to something like "initialize"
func load_from_json(file_path):
    _game_data = Utilities.load_json_data_as_dictionary(file_path)
    _current_area = "alya's room"

# todo: forget encapsulation; just expose _game_data
func game_data():
    return _game_data

func set_game_data(new_game_data):
    _game_data = new_game_data

func set_game_data_by_key(key, new_value):
    _game_data[key] = new_value

func get_current_area():
    return _current_area

func set_current_area(area):
    _current_area = area

func get_current_poi():
    return _current_poi

func set_current_poi(poi):
    _current_poi = poi

func erase_game_data_by_key(key):
    _game_data.erase(key)