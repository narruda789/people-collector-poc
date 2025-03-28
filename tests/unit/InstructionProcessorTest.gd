extends GutTest

func test_process_executes_user_instruction():
    var instruction_double = InstructionDouble.new()
    InstructionProcessor.new().process(instruction_double)
    assert_true(instruction_double.was_execute_called)

func test_process_parses_and_executes_auto_instruction():
    var user_instruction_double = InstructionDouble.new()
    user_instruction_double.execute_output_to_return = "first instruction"

    var auto_instruction_double = InstructionDouble.new()
    auto_instruction_double.execute_output_to_return = "second instruction"
    var text_parser_double = TextParserDouble.new()
    text_parser_double.auto_instruction_to_return = auto_instruction_double

    GameData.auto_commands = ["something"]

    var instruction_processor = InstructionProcessor.new()
    instruction_processor._text_parser = text_parser_double

    var output = instruction_processor.process(user_instruction_double)

    assert_eq(text_parser_double.parse_auto_command_called_with, ["something"])
    assert_true(auto_instruction_double.was_execute_called)
    assert_eq(output, ["first instruction", "second instruction"])

func test_multiple_auto_instructions():
    var instruction_processor = InstructionProcessor.new()

    var user_instruction_double = InstructionDouble.new()
    user_instruction_double.execute_output_to_return = "user"

    var auto_instruction_double = InstructionDouble.new()
    auto_instruction_double.execute_output_to_return = "auto"

    var text_parser_double = TextParserDouble.new()
    text_parser_double.auto_instruction_to_return = auto_instruction_double

    instruction_processor._text_parser = text_parser_double

    GameData.auto_commands = ["y", "x"]

    var output = instruction_processor.process(user_instruction_double)

    assert_eq(text_parser_double.parse_auto_command_called_with, ["y", "x"])
    assert_eq(output, ["user", "auto", "auto"])

func test_no_auto_instructions():
    var instruction_processor = InstructionProcessor.new()

    var user_instruction_double = InstructionDouble.new()
    user_instruction_double.execute_output_to_return = "FIRST"

    var output = instruction_processor.process(user_instruction_double)

    assert_eq(output, ["FIRST"])

func test_process_returns_instruction_output():
    var instruction_double = InstructionDouble.new()
    instruction_double.execute_output_to_return = "output from user instruction"
    var output = InstructionProcessor.new().process(instruction_double)
    assert_eq(output, ["output from user instruction"])