class_name InstructionProcessorDouble extends InstructionProcessor

#input
var process_called_with_user_instruction: Instruction = null

#output
var process_output_to_return = null

func process(user_instruction: Instruction = null) -> String:
    process_called_with_user_instruction = user_instruction
    return process_output_to_return