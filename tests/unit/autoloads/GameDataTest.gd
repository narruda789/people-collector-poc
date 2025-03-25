extends GutTest

var _path_to_root = "res://"

func test_initialize_from_json_sets_game_data():
    GameData.initialize_from_json(_path_to_root + "tests/resources/mockGameData.json")
    var game_data = GameData.areas
    assert_eq(game_data["key"], "value")
    assert_eq(GameData.current_map, "alya's house")
    assert_eq(GameData.current_area, "alya's room")
    assert_eq(GameData.current_poi, null)