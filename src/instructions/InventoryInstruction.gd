class_name InventoryInstruction extends Instruction

func _init():
    _can_execute_before_continue = false

func _execute() -> String:
    return Inventory.render()