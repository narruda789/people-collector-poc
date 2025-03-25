extends Node

var _game_data = null

func load_from_json(file_path):
    _game_data = Utilities.load_json_data_as_dictionary(file_path)

func game_data():
    return _game_data

func set_game_data(new_game_data):
    _game_data = new_game_data

func set_game_data_by_key(key, new_value):
    _game_data[key] = new_value