extends Node

var items = []

func render():
	var to_render = "INVENTORY:\n"
	if items.is_empty():
		return to_render + "You aren't carrying anything.\n"    

	for item in items:
		to_render += item._name + "\n"

	return to_render

func add(item: Item):
	items.append(item)

func clear():
	items = []
