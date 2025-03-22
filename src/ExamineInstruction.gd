class_name ExamineInstruction extends Instruction

var _area = null
var _poi = null

func _init(area, poi):
	_area = area
	_poi = poi

func execute():

	if _poi not in _area.poi:
		return "Can't examine that."

	var poi = _area.poi[_poi]
	var message = ""
	message += poi.description

	if "items" in poi and not poi.items.is_empty():
		message += "\n"
		for item in poi.items:
			message += "\n%s" % poi.items[item].beforePickup

	return message
