class_name ExamineInstruction extends Instruction

var _poi = null

func _init(poi):
	_poi = poi

func execute() -> String:
	var game_data = GameData.areas
	var current_area = GameData.current_area
	
	if "poi" in game_data[current_area] and _poi in game_data[current_area].poi:
		var poi = game_data[current_area].poi[_poi]
		var message = ""
		message += poi.description

		if "items" in poi:
			for item in poi.items:
				message += "\n"
				message += "\n%s" % poi.items[item].beforePickup

		GameData.current_poi = _poi

		return message

	return "Can't examine that."