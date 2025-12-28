extends manipulateStatsBase


@export var number:TextEdit

#changes made to see if this can be used to make the stat changing function not swap every time a change is made
func pressed():
	var b:Big
	var i:int
	i = 0
	b = Big.new(number.text)
	print("Big is..... " +  b.toScientific())
	if(typeOfFunction.selected < 7):
		i = statSelect.selected
	emit_signal("manipulate",statSelect.selected,typeOfFunction.selected,b)
	
	statSelect.selected =i
