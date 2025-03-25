class_name MapInstruction extends Instruction

func execute():
	var game_data = GameData.game_data()
	var current_area = GameData.get_current_area()

	if current_area in game_data and "map" in game_data[current_area]:
			var map_name = game_data[current_area].map
			var map_areas = game_data.maps[map_name].areas

			var map = "%s:" % game_data.maps[map_name].name.to_upper()
			for area in map_areas:
				map += "\n  %s" % game_data[area].name
				if game_data[area] == game_data[current_area]:
					map += " (Alya is here!)"
			return map
	return "???:\n (!) No map available!"
