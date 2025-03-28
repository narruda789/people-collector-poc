extends LineEdit

var gameText: RichTextLabel
var text_parser = null
var game_data_processor = null

# Called when the node enters the scene tree for the first time.
func _ready():
	gameText = get_parent().get_parent().get_node("GameText")
	text_parser = TextParser.new()
	game_data_processor = GameDataProcessor.new()
	gameText.append_text(game_data_processor.process_action(InstructionSet.RESTART))
	self.grab_focus()

# todo: can we get some tests in here?
func _on_text_submitted(new_text):
	if (new_text.is_empty()):
		return

	# clear the text of the text area.
	self.set_text('')

	# echo user command
	var output_text = ''
	output_text += " > " + new_text + "\n\n"

	output_text += game_data_processor.process_command_text(new_text)

	gameText.append_text(output_text)
