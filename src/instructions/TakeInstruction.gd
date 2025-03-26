class_name TakeInstruction extends Instruction

var _item = null

func _init(item):
    _can_execute_before_continue = false
    _item = item

func _execute() -> String:
    var game_data = GameData.areas
    var current_poi = GameData.current_poi
    var current_area = GameData.current_area

    if "poi" in game_data[current_area] \
                and current_poi in game_data[current_area].poi \
                and "items" in game_data[current_area].poi[current_poi] \
                and _item in game_data[current_area].poi[current_poi].items:

        var item = game_data[current_area].poi[current_poi].items[_item]
        var item_display_name = item.displayName

        var stat_block = null
        if "modifiers" in item:
            stat_block = StatBlock._from_dict(item["modifiers"])
            for key in item["modifiers"].keys():
                GameData.update_party_stat(key, item["modifiers"][key])

        Inventory.add(Item.new(_item, item_display_name, stat_block))

        game_data[current_area].poi[current_poi].items.erase(_item)
        return "You pick up the %s." % item_display_name
    return "Can't pick that up."