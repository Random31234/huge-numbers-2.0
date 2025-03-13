extends manipulateStatsBase


@export var number:TextEdit


func pressed():
	var b:Big
	
	
	b = Big.new(number.text)
	print("Big is..... " +  b.toScientific())
	emit_signal("manipulate",statSelect.selected,typeOfFunction.selected,b)
