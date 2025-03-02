extends OptionButton

@export var documents:Array[String]
@export var t:RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	t.text = documents[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#documentation system is in place.
func TopicSelected(index: int) -> void:
	t.text = documents[index]
