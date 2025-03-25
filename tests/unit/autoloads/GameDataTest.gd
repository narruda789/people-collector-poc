extends GutTest

var _path_to_root = "res://"

func test_initialize_from_json_sets_game_data():
    GameData.initialize_from_json(_path_to_root + "data/alya.json")
    
    assert_eq(GameData.areas["alya's room"].map, "alya's house")
    assert_eq(GameData.current_area, "alya's room")
    assert_eq(GameData.current_map, "alya's house")
    assert_eq(GameData.current_poi, null)