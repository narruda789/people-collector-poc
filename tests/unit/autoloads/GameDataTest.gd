extends GutTest

var _path_to_root = "res://"

func test_load_from_json_sets_game_data():
    GameData.load_from_json(_path_to_root + "tests/resources/mockGameData.json")
    var game_data = GameData.get_data()
    assert_eq(game_data["key"], "value")

func test_set_data():
    GameData._game_data = "out with the old"
    GameData.set_data("in with the new")
    assert_eq(GameData.get_data(), "in with the new")

func test_set_game_data_by_key():
    GameData._game_data = {
        "fruit" : "banana"
    }
    GameData.set_data_by_key("fruit", "kiwi")
    assert_eq(GameData.get_data()["fruit"], "kiwi")