extends Node

var _items = []

func render():
	var to_render = "INVENTORY:"
	if _items.is_empty():
		return to_render + "\n (!) You aren't carrying anything."    

	for item in _items:
		to_render += "\n  " + item.get_display_name()

	return to_render

func add(item: Item):
	_items.append(item)

func clear():
	_items = []

func get_as_list():
	return _items
