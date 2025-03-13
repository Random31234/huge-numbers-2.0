extends manipulateStatsBase

@export var mantissa:TextEdit
@export var exponent:TextEdit

func pressed():
	
	var b:Big
	
	
	var x = int(exponent.text)
	print (x)
	var z = float(mantissa.text)
	b = Big.new(z,x)
	print("Big is... " + b.toScientific() )
	emit_signal("manipulate",statSelect.selected,typeOfFunction.selected, b)
