extends GutTest

var _processor = GameDataProcessor.new()

func before_each():
    _processor.current_area = _processor.areas["area1"]

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
    assert_string_contains(message, "reset")
    assert_string_contains(message, "help")
    assert_string_contains(message, "[lb]i[rb]nventory")

func test_examine_instruction_sets_current_poi():
    # todo: contact GUT guy with funny test double error...
    # var instruction_double = double(ExamineInstruction)
    var instruction_double = InstructionDouble.new()
    _processor.process_action(InstructionSet.EXAMINE, "oak tree", instruction_double)
    assert_true(instruction_double.was_execute_called)
    assert_eq(_processor._current_poi, "oak tree")
