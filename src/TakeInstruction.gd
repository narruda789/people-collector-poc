class_name TakeInstruction extends Instruction

var _area = null
var _target = null

func _init(area, target):
	_area = area
	_target = target

func execute():
	if "items" in _area and _target in _area.items:
		Inventory.add(Item.new(_target))
		_area.items.erase(_target)
		return "Alya picks up the %s." % _target
	return "Can't pick that up."
