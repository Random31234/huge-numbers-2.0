extends Control

signal manipulate(index:int,funcIndex:int,b:Big)
signal append(b:Big,n:String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func manipulateS(index:int,funcIndex:int,b:Big):
	emit_signal("manipulate", index,funcIndex,b)

func appendS(b:Big,n:String):
	emit_signal("append",b,n)
	print("appended")
	print(b.toScientific())
