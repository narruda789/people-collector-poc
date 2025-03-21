extends GutTest

var _processor = GameDataProcessor.new()

func test_not_found_instruction():
    var message = _processor.process_action(InstructionSet.NOT_FOUND)
    assert_eq(message, "Can't do that!")

func test_help_instruction_says_help():
    var message = _processor.process_action(InstructionSet.HELP)
    assert_string_contains(message, "HELP:")

func test_help_instruction_contains_every_instruction():
    var message = _processor.process_action(InstructionSet.HELP)
    assert_string_contains(message, "examine")
    assert_string_contains(message, "get")
    assert_string_contains(message, "reset")
    assert_string_contains(message, "help")
    assert_string_contains(message, "[lb]i[rb]nventory")