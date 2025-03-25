extends GutTest

var _path_to_root = "res://"

func test_load_from_json_sets_game_data():
    GameData.load_from_json(_path_to_root + "tests/resources/mockGameData.json")
    var game_data = GameData.game_data()
    assert_eq(game_data["key"], "value")

func test_set_data():
    GameData._game_data = "out with the old"
    GameData.set_game_data("in with the new")
    assert_eq(GameData.game_data(), "in with the new")

func test_set_game_data_by_key():
    GameData._game_data = {
        "fruit" : "banana"
    }
    GameData.set_game_data_by_key("fruit", "kiwi")
    assert_eq(GameData.game_data()["fruit"], "kiwi")

func test_set_current_poi():
    GameData.set_current_poi("refrigerator")
    assert_eq(GameData.get_current_poi(), "refrigerator")