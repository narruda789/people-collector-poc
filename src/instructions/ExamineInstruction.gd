class_name ExamineInstruction extends Instruction

var _poi = null
var _area = null

func _init(poi, area):
	_poi = poi
	_area = area

func execute():

	if _poi not in _area.poi:
		return "Can't examine that."

	var poi = _area.poi[_poi]
	var message = ""
	message += poi.description

	if "items" in poi:
		for item in poi.items:
			message += "\n"
			message += "\n%s" % poi.items[item].beforePickup

	GameData.set_current_poi(_poi)

	return message
