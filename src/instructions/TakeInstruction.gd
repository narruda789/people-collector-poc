class_name TakeInstruction extends Instruction

var _item = null
var _area = null
var _poi = null

func _init(item, area, poi=null):
	_item = item
	_area = area
	_poi = poi

func execute():
	if _poi != null:
		return _take_item(_area.poi[_poi])
	return _take_item(_area)

func _take_item(scope):
	if "items" in scope and _item in scope.items:
		var item_display_name = scope.items[_item].displayName
		Inventory.add(Item.new(_item, item_display_name))
		scope.items.erase(_item)
		return "Alya picks up the %s." % item_display_name
	return "Can't pick that up."