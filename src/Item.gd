class_name Item

var _name: String
var _display_name: String
var _modifiers = StatBlock.new(0, 0, 0, 0)

func _init(name: String, display_name: String, modifiers: StatBlock = null):
    _name = name
    _display_name = display_name
    if modifiers != null:
        _modifiers = modifiers

func display():
    var stats = _modifiers.get_stats()
    var modifiers = []

    for stat_key in [StatBlock.DEFENSE, StatBlock.RESOURCES, StatBlock.CHARM, StatBlock.MORALE]:
        if stat_key in stats and stats[stat_key] != 0:
            var plus_or_minus = "+" if stats[stat_key] > 0 else ""
            modifiers.append("%s%d %s" % [plus_or_minus, stats[stat_key], stat_key.to_upper()])

    var to_display = _display_name
    if not modifiers.is_empty():
        to_display += " ("
        to_display += modifiers.pop_front()

        while modifiers.size() > 0:
            to_display += ", "
            to_display += modifiers.pop_front()

        to_display += ")"

    return to_display

func get_modifiers():
    return _modifiers