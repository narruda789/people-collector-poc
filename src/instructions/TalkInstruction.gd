class_name TalkInstruction extends Instruction

var _person = null
var _current_area = null

func _init(person):
    _can_execute_before_continue = false
    _person = person
    _current_area = GameData.areas[GameData.current_area]

func _execute():
    var person = _get_person()
    if person != null:
        if "talk" in _current_area["people"][_person]:
            return "%s says: \"%s\"" % [person.name, person["talk"]]
        return person.name + " says nothing."
    return "Can't talk to them."

func _set_auto_instruction():
    var person = _get_person()
    if person != null and "on_talk" in person:
        GameData.auto_instruction = person["on_talk"]

func _get_person():
    if "people" in _current_area:
        if _person in _current_area["people"]:
            return _current_area["people"][_person]
    return null