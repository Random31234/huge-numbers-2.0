extends Control


class_name manipulateStatsBase
signal manipulate(index:int,funcIndex:int,b:Big)
@export var statSelect:OptionButton
@export var typeOfFunction:OptionButton



func updateStatSelection(a:Array[String]):
	statSelect.clear()
	for x in a:
		statSelect.add_item(x)
		print(x)
