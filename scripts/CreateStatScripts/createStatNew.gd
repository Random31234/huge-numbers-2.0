extends createStatBase


@export var number:TextEdit


func pressed():
	var b:Big
	
	
	b = Big.new(number.text)
	
	emit_signal("Create",b,nameBox.text)
