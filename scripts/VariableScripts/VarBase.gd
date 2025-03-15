extends createStatBase

class_name varBase
@export var opt:OptionButton
signal setVariable(b:Big,n:String,i:int)
signal delete(i:int)


func d():
	
	emit_signal("delete",opt.selected)
