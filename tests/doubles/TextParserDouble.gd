class_name TextParserDouble extends TextParser

# input
var parse_user_command_called_with = null

# output
var parse_user_command_instruction_to_return: Instruction = null

func parse_user_command(user_input: String = "") -> Instruction:
    parse_user_command_called_with = user_input
    return parse_user_command_instruction_to_return