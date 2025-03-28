class_name InputHandler

var _text_parser = null
var _instruction_processor = null

func _init():
	_text_parser = TextParser.new()
	_instruction_processor = InstructionProcessor.new()

func process(user_input: String) -> String:
	var user_instruction = _text_parser.parse_user_command(user_input)

	return _instruction_processor.process(user_instruction)[0] + "\n\n"