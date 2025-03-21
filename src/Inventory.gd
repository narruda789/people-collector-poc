extends Node

var items = []

func render():
	var to_render = "INVENTORY:\n"
	if items.is_empty():
		return to_render + " (!) You aren't carrying anything."    

	for item in items:
		to_render += "\n" + item._name

	return to_render

func add(item: Item):
	items.append(item)

func clear():
	items = []
