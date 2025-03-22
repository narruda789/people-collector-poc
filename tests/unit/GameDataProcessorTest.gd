extends GutTest

var _processor = GameDataProcessor.new()

func before_each():
    _processor.current_area = _processor.areas["alyasRoom"]

func test_not_found_instruction():
    var message = _processor.process_action(InstructionSet.NOT_FOUND)
    assert_eq(message, "Can't do that!")

func test_help_instruction_says_help():
    var message = _processor.process_action(InstructionSet.HELP)
    assert_string_contains(message, "HELP:")

func test_help_instruction_contains_every_instruction():
    var message = _processor.process_action(InstructionSet.HELP)
    assert_string_contains(message, "examine")
    assert_string_contains(message, "take")
    assert_string_contains(message, "restart")
    assert_string_contains(message, "help")
    assert_string_contains(message, "[lb]i[rb]nventory")

func test_examine_instruction_sets_current_poi():
    # todo: contact GUT guy with funny test double error...
    # var instruction_double = double(ExamineInstruction)
    var instruction_double = InstructionDouble.new()
    _processor.process_action(InstructionSet.EXAMINE, "oak tree", instruction_double)
    assert_true(instruction_double.was_execute_called)
    assert_eq(_processor.current_poi, "oak tree")

func test_restart_instruction_resets_game_data():
    _processor.current_area = "some area"
    _processor.current_poi = "some poi"
    _processor.areas = "some game data"
    Inventory.add(Item.new("some item"))

    _processor.process_action(InstructionSet.RESTART)
    
    assert_eq(_processor.current_area, _processor.areas["alyasRoom"])
    assert_null(_processor.current_poi)
    assert_not_null(_processor.areas)
    assert_eq(Inventory.get_as_list(), [])