extends calculationInputBase

@export var mantissa:TextEdit
@export var exponent:TextEdit



func pressed():
	var b:Big
	
	
	var x = int(exponent.text)
	var z = float(mantissa.text)
	b = Big.new(z,x)
	
	emit_signal("input",b)
