class_name StatsInstruction extends Instruction

var _stat_bar = {
    0: "|-----|",
    1: "|█----|",
    2: "|██---|",
    3: "|███--|",
    4: "|████-|",
    5: "|█████|"
}

func _init():
    _can_execute_before_continue = false

func _execute() -> String:
    var stats_display = ""
    stats_display += "PARTY STATS:"
    stats_display += "\n  %s DEFENSE   : Withstand physical threats" % _stat_bar_for("defense")
    stats_display += "\n\n  %s RESOURCES : Keep everyone fed, clothed, and comfy" % _stat_bar_for("resources")
    stats_display += "\n\n  %s CHARM     : Influence others in social situations" % _stat_bar_for("charm")
    stats_display += "\n"
    stats_display += "\nMORALE:"
    stats_display += "\n  %s MORALE    : Enjoy better odds of success overall" % _stat_bar_for("morale")

    return stats_display

func _stat_bar_for(stat_name):
    return _stat_bar[int(GameData.stats["party"][stat_name])]

func _append_auto_command():
    pass