class_name TakeInstruction extends Instruction

var _item = null

func _init(item):
	_item = item

func execute():
	var game_data = GameData.areas
	var current_poi = GameData.current_poi
	var current_area = GameData.current_area

	if "poi" in game_data[current_area] \
				and current_poi in game_data[current_area].poi \
				and "items" in game_data[current_area].poi[current_poi] \
				and _item in game_data[current_area].poi[current_poi].items:
		var item_display_name = game_data[current_area].poi[current_poi].items[_item].displayName
		Inventory.add(Item.new(_item, item_display_name))

		game_data[current_area].poi[current_poi].items.erase(_item)
		return "Alya picks up the %s." % item_display_name
	return "Can't pick that up."