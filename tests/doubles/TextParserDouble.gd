class_name TextParserDouble extends TextParser

# input
var parse_user_command_called_with = []
var parse_auto_command_called_with = []

# output
var user_instruction_to_return: Instruction = null
var auto_instruction_to_return: Instruction = null

func parse_user_command(user_input: String = "") -> Instruction:
    parse_user_command_called_with.append(user_input)
    return user_instruction_to_return

func parse_auto_command(auto_input: String = "") -> Instruction:
    parse_auto_command_called_with.append(auto_input)
    return auto_instruction_to_return