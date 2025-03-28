extends GutTest

func test_process_executes_user_instruction():
    var instruction_double = InstructionDouble.new()
    InstructionProcessor.new().process(instruction_double)
    assert_true(instruction_double.was_execute_called)

# todo: TEST test TEST test TEST
func test_process_executes_auto_commands():
    GameData.auto_commands = ["something"]

func test_process_returns_instruction_output():
    var instruction_double = InstructionDouble.new()
    instruction_double.execute_output_to_return = "output from user instruction"
    var output = InstructionProcessor.new().process(instruction_double)
    assert_eq(output, "output from user instruction")