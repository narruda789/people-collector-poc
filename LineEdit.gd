extends LineEdit

var gameText: RichTextLabel
var text_parser = null
var input_handler = null

# Called when the node enters the scene tree for the first time.
func _ready():
	gameText = get_parent().get_parent().get_node("GameText")
	text_parser = TextParser.new()
	input_handler = InputHandler.new()
	# todo: there's probably a better way to do this?
	gameText.append_text(input_handler.process("restart"))
	self.grab_focus()

# todo: can we get some tests in here?
func _on_text_submitted(new_text):
	if (new_text.is_empty()):
		return

	# clear the text of the input field
	self.set_text('')

	# echo user command
	var output_text = ''
	output_text += " > " + new_text + "\n\n"

	output_text += input_handler.process(new_text)

	gameText.append_text(output_text)
