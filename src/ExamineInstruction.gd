class_name ExamineInstruction extends Instruction

var _area = null
var _target = null

func _init(area, target):
	_area = area
	_target = target

func execute():
	if _target not in _area.poi:
		return "Can't examine that."
	return _area.poi[_target].description
