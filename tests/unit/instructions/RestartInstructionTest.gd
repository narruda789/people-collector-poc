extends GutTest

var _instruction = null
var _base_path = "res://tests/resources/"

func before_each():
    GameData._area_data_file_path = _base_path + "mockGameAreas.json"
    GameData._stats_data_file_path = _base_path + "mockGameStats.json"
    _instruction = RestartInstruction.new()

func test_restart_resets_area_data():
    GameData.areas = "some game data"
    GameData.current_area = "some area"
    GameData.current_map = "some map"
    GameData.current_poi = "some poi"
    Inventory.add(Item.new("some item", "Some Item"))

    _instruction.execute()
    
    assert_has(GameData.areas, "area 1")
    assert_eq(GameData.current_area, "area 1")
    assert_eq(GameData.current_map, "map 1")
    assert_null(GameData.current_poi)
    assert_eq(Inventory.get_as_list(), [])

func test_restart_resets_stats_data():
    GameData.stats = "some stats"
    _instruction.execute()
    assert_has(GameData.stats, "party")

func test_restart_prints_game_intro():
    var render = _instruction.execute()
    assert_string_contains(render, "Welcome to the game!")

func test_restart_adds_intro_text_to_next_text():
    GameData.next_text = ["something", "something else"]
    _instruction.execute()
    assert_eq(GameData.next_text, ["Welcome to Area 1!"])