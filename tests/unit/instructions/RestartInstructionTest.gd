extends GutTest

var _instruction = null

func before_each():
    _instruction = RestartInstruction.new()
    _instruction._game_data_path = "res://tests/resources/mockGameAreas.json"

func test_restart_instruction_resets_game_data():
    GameData.areas = "some game data"
    GameData.current_area = "some area"
    GameData.current_map = "some map"
    GameData.current_poi = "some poi"
    Inventory.add(Item.new("some item", "Some Item"))

    var render = _instruction.execute()
    
    assert_has(GameData.areas, "area 1")
    assert_eq(GameData.current_area, "area 1")
    assert_eq(GameData.current_map, "map 1")
    assert_null(GameData.current_poi)
    assert_eq(Inventory.get_as_list(), [])

    assert_string_contains(render, "Welcome to the game!")

func test_restart_adds_intro_text_to_next_text():
    GameData.next_text = ["something", "something else"]
    _instruction.execute()
    assert_eq(GameData.next_text, ["Welcome to Area 1!"])