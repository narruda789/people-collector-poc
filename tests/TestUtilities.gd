class_name TestUtilities

static func clear_game_data():
    GameData.areas = null
    GameData.current_map = null
    GameData.current_area = null
    GameData.current_poi = null
    GameData.next_text = []

    GameData.stats = {
	    "party" : StatBlock.new(0, 0, 0, 0).get_stats()
    }