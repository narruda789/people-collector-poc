class_name ContinueInstruction extends Instruction

func execute():
    if GameData.next_text.is_empty():
        return "Nothing more to say."
    return GameData.next_text.pop_front()