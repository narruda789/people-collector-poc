extends GutTest

var _processor = InputHandler.new()

func test_process_action_calls_execute():
	var instruction_double = InstructionDouble.new()
	_processor.process_action(null, null, instruction_double)
	assert_true(instruction_double.was_execute_called)