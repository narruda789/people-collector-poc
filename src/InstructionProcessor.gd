class_name InstructionProcessor

func process(user_instruction: Instruction) -> String:
    var output = user_instruction.execute()
    # todo:
    # loop while GameData.auto_commands array not empty
    #   pop auto command json from GameData
    #   TextParser -> parse auto command
    #   AutoInstruction.execute()
    return output