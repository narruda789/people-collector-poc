extends Node

var items = []

func render():
	var to_render = "INVENTORY:"
	if items.is_empty():
		return to_render + "\n (!) You aren't carrying anything."    

	for item in items:
		to_render += "\n" + item._name

	return to_render

func add(item: Item):
	items.append(item)

func clear():
	items = []
