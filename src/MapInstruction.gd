class_name MapInstruction extends Instruction

var _areas = null
var _current_area = null

func _init(areas, current_area):
	_areas = areas
	_current_area = current_area

func execute():
	if "map" in _current_area:
		var map_name = _current_area.map
		var map_areas = _areas.maps[map_name].areas

		var map = "%s:" % _areas.maps[map_name].name.to_upper()
		for area in map_areas:
			map += "\n  %s" % _areas[area].name
		return map
	return "???:\n (!) No map available!"
