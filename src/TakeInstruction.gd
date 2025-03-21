class_name TakeInstruction extends Instruction

var _area = null
var _target = null

# todo: gonna see what happens when we try to invoke the execute method on this guy
func _init(area, target):
    _area = area
    _target = target

func execute():
    if _target in _area["items"].keys():
        Inventory.add(Item.new(_target))
        return "Alya picks up the %s." % _target
    return "Can't pick that up."