extends VBoxContainer

@export var story: InkStory

# Called when the node enters the scene tree for the first time.
func _ready():
	continue_story()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func continue_story():
	for child in get_children():
		child.queue_free()
		
	var content = Label.new()
	content.text = story.ContinueMaximally()
	add_child(content)
	
	for choice: InkChoice in story.GetCurrentChoices():
		var button = Button.new()
		button.text = choice.GetText()
		button.pressed.connect(self.choose.bind(choice))
		add_child(button)

func choose(choice: InkChoice):
	story.ChooseChoiceIndex(choice.Index)
	continue_story()
