class_name StatsInstruction extends Instruction

func _init():
    _can_execute_before_continue = false

func _execute() -> String:
    var stats_display = ""
    stats_display += "PARTY STATS:"
    stats_display += "\n  [lb] | | | | [rb] DEFENSE   : Withstand physical threats"
    stats_display += "\n  [lb] | | | | [rb] RESOURCES : Keep everyone fed, clothed, and comfy"
    stats_display += "\n  [lb] | | | | [rb] CHARM     : Influence others in social situations"
    stats_display += "\n"
    stats_display += "\nMORALE:"
    stats_display += "\n  [lb] | | | | [rb] MORALE    : Enjoy better odds of success overall"

    return stats_display