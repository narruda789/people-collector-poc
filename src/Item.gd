class_name Item

var _name: String
var _display_name: String

func _init(name: String, display_name: String):
    _name = name
    _display_name = display_name

func get_display_name():
    return _display_name