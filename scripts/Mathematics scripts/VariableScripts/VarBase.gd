extends createStatBase

class_name varBase
@export var opt:OptionButton
@export var box:VBoxContainer
@export var swappable:bool
signal setVariable(b:Big,n:String,i:int)
signal delete(i:int)
var statEntity = preload("res://scenes/StatEntity.tscn")

func d():
	
	emit_signal("delete",opt.selected)

func updateVariables(b:Array[Big],n:Array[String]):
	opt.clear()
	
	for x in n:
		opt.add_item(x)
	var z
	var i
	z =0
	for xyz in b:
		i = statEntity.instantiate()
		i.get_child(0).text = n[z] + " : " +b[z].toScientific()
		#set up swappable
		#also work on swap function
		box.add_child(i)
		if(swappable == true):
			i.get_child(1).visible = true
			i.get_child(1).set_process(0)
			i.get_child(1).connect("button_down",swapFunction.bind(i.get_index(true)))
		if(swappable == false):
			i.get_child(1).visible = false
			i.get_child(1).set_process(4)
		
		z+=1
	
	


func swapFunction():
	pass
