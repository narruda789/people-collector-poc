class_name MapInstruction extends Instruction

var _maps = null
var _current_area = null

func _init(maps, current_area):
    _maps = maps
    _current_area = current_area

func execute():
    return ""