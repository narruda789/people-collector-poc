class_name ExamineInstruction

var _area = null
var _target = null

func _init(area, target):
	_area = area
	_target = target

func execute():
	# todo: test if target not in poi
	return _area.poi[_target].description
