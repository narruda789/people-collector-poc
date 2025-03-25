class_name MapInstruction extends Instruction

var _current_area = null

func _init(current_area):
	_current_area = current_area

func execute():
	var game_data = GameData.game_data()
	if "map" in _current_area:
		var map_name = _current_area.map
		var map_areas = game_data.maps[map_name].areas

		var map = "%s:" % game_data.maps[map_name].name.to_upper()
		for area in map_areas:
			map += "\n  %s" % game_data[area].name
			if game_data[area] == _current_area:
				map += " (Alya is here!)"
		return map
	return "???:\n (!) No map available!"
