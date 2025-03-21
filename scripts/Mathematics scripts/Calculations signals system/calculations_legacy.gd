extends Control

@export var mathBox:RichTextLabel
signal calculate(b:Big,m:String)

#non legacy version

func calc(b:Big):
	
	emit_signal("calculate",b,mathBox.text)
	
	pass
	

func inputLine():
	pass
