class_name GoInstruction extends Instruction

var _new_area = null

func _init(area):
    _new_area = area

func execute():
    if _new_area == GameData.current_area:
        return " (!) Already there!"

    if _new_area in GameData.areas.maps[GameData.current_map]["areas"]:
        GameData.current_poi = null
        GameData.current_area = _new_area
        return GameData.areas[_new_area]["intro"]
        
    return " (!) Can't go there!"
