extends GutTest

func test_restart_instruction_resets_game_data():
    
    GameData.areas = "some game data"
    GameData.current_area = "some area"
    GameData.current_map = "some map"
    GameData.current_poi = "some poi"
    Inventory.add(Item.new("some item", "Some Item"))

    var instruction = RestartInstruction.new()
    instruction._game_data_path = "res://tests/resources/mockGameAreas.json"
    var render = instruction.execute()
    
    assert_has(GameData.areas, "area 1")
    assert_eq(GameData.current_area, "area 1")
    assert_eq(GameData.current_map, "map 1")
    assert_null(GameData.current_poi)
    assert_eq(Inventory.get_as_list(), [])

    assert_string_contains(render, "Welcome to the game!")
    assert_string_contains(render, "Welcome to Area 1!")