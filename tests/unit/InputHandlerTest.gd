extends GutTest

var _input_handler = InputHandler.new()

func test_process_input():
	var text_parser_double = TextParserDouble.new()
	var user_instruction_double = InstructionDouble.new()
	text_parser_double.parse_user_command_instruction_to_return = user_instruction_double

	_input_handler._text_parser = text_parser_double

	var instruction_processor_double = InstructionProcessorDouble.new()
	instruction_processor_double.process_output_to_return = "Instruction output!"
	_input_handler._instruction_processor = instruction_processor_double

	var actual_output = _input_handler.process("")

	assert_eq( \
			instruction_processor_double.process_called_with_user_instruction, \
			user_instruction_double)
	assert_eq(actual_output, "Instruction output!")