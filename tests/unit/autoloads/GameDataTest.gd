extends GutTest

var _path_to_root = "res://"

func test_load_from_json_sets_game_data():
    GameData.initialize_from_json(_path_to_root + "tests/resources/mockGameData.json")
    var game_data = GameData.areas
    assert_eq(game_data["key"], "value")
    assert_eq(GameData.current_area, "alya's room")

func test_set_data():
    GameData.areas = "out with the old"
    GameData.areas = "in with the new"
    assert_eq(GameData.areas, "in with the new")

func test_set_current_area():
    GameData.current_area = "kitchen"
    assert_eq(GameData.current_area, "kitchen")

func test_set_current_poi():
    GameData.current_poi = "refrigerator"
    assert_eq(GameData.current_poi, "refrigerator")