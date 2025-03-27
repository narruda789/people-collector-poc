class_name Instruction

var _can_execute_before_continue = true

func execute() -> String:
    if !_can_execute_before_continue and GameData.next_text:
        return "Must continue reading first."

    _set_auto_instruction()
    return _execute()

func _execute() -> String:
    assert(false, "Instruction._execute() is an abstract function. Please extend and implement.")
    return ""

func _set_auto_instruction():
    assert(false, "Instruction._set_auto_instruction() is an abstract function. Please extend and implement.")
