extends manipulateStatsBase


@export var number:TextEdit


func pressed():
	var b:Big
	
	
	b = Big.new(number.text)
	
	emit_signal("Manipulate",statSelect.selected,typeOfFunction.selected,b)
