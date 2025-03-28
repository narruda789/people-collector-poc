class_name ContinueInstruction extends Instruction

func _execute() -> String:
    if GameData.next_text.is_empty():
        return "Nothing more to say."
    return GameData.next_text.pop_front()

func _append_auto_command():
    pass