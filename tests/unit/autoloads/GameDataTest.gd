extends GutTest

func test_initialize_sets_game_data():
    GameData._area_data_file_path = "res://data/areas.json"
    GameData.initialize()
    
    assert_eq(GameData.areas["alya's room"].map, "alya's house")
    assert_eq(GameData.current_area, "alya's room")
    assert_eq(GameData.current_map, "alya's house")
    assert_eq(GameData.current_poi, null)
    assert_eq(GameData.next_text, [])