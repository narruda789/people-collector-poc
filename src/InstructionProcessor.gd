class_name InstructionProcessor

var _text_parser = null

func _init():
    _text_parser = TextParser.new()

func process(user_instruction: Instruction) -> Array[String]:
    var output: Array[String] = []
    output.append(user_instruction.execute())
    
    while not GameData.auto_commands.is_empty():
        var auto_command = GameData.auto_commands.pop_front()
        var auto_instruction = _text_parser.parse_auto_command(auto_command)
        output.append(auto_instruction.execute())
    return output