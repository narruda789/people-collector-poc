class_name MapInstruction extends Instruction

func _init():
	_can_execute_before_continue = false

func _execute() -> String:
	var game_data = GameData.areas
	var current_area = GameData.current_area

	if current_area in game_data and "map" in game_data[current_area]:
			var map_name = game_data[current_area].map
			var map_areas = game_data.maps[map_name].areas

			var map = "%s:" % game_data.maps[map_name].name.to_upper()
			for area in map_areas:
				map += "\n  %s" % game_data[area].name
				if game_data[area] == game_data[current_area]:
					map += " (You are here!)"
			return map
	return "???:\n (!) No map available!"

func _append_auto_command():
	pass
