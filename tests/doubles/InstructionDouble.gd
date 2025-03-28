class_name InstructionDouble extends Instruction

# input
var was_execute_called = false

# output
var execute_output_to_return: String = ""

func execute() -> String:
    was_execute_called = true
    return execute_output_to_return