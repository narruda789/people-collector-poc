class_name ExamineInstruction

var _area = null
var _target = null

func _init(area, target):
	_area = area
	_target = target

func execute():
	return _area.poi[_target].description
