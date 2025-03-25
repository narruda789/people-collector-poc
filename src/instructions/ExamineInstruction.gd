class_name ExamineInstruction extends Instruction

var _poi = null

func _init(poi):
	_poi = poi

func execute():
	var game_data = GameData.game_data()
	var current_area = GameData.get_current_area()

	if _poi not in game_data[current_area].poi:
		return "Can't examine that."

	var poi = game_data[current_area].poi[_poi]
	var message = ""
	message += poi.description

	if "items" in poi:
		for item in poi.items:
			message += "\n"
			message += "\n%s" % poi.items[item].beforePickup

	GameData.set_current_poi(_poi)

	return message
