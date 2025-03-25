class_name TakeInstruction extends Instruction

var _item = null
var _area = null

func _init(item, area):
	_item = item
	_area = area

func execute():
	var current_poi = GameData.get_current_poi()
	if "poi" in _area and current_poi in _area.poi:
		return _take_item(_area.poi[current_poi])
	return _take_item(_area)

func _take_item(scope):
	if "items" in scope and _item in scope.items:
		var item_display_name = scope.items[_item].displayName
		Inventory.add(Item.new(_item, item_display_name))
		scope.items.erase(_item)
		return "Alya picks up the %s." % item_display_name
	return "Can't pick that up."