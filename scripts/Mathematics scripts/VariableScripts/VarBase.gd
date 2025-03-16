extends createStatBase

class_name varBase
@export var opt:OptionButton
@export var box:VBoxContainer
@export var swappable:bool
@export var selected:bool
@export var firstSelected:int
var bSize:int
signal setVariable(b:Big,n:String,i:int)
signal delete(i:int)
signal swap(i:int,f:int)
var statEntity = preload("res://scenes/StatEntity.tscn")




func d():
	
	emit_signal("delete",opt.selected)

func updateVariables(b:Array[Big],n:Array[String],s:bool):
	var h:int
	h = opt.selected
	
	opt.clear()
	
	for x in box.get_children():
		box.remove_child(x)
		x.queue_free()
		
	swappable = s
	print(s)
	for x in n:
		opt.add_item(x)
	
	opt.add_item("New variable")
	var z
	var i
	bSize =b.size()
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
	opt.selected = h
	

func swapFunction(i:int):
	
	if (selected == true):
		
		if(i < bSize && firstSelected < bSize):
			swapper(i, firstSelected)
			selected = false
			return
	if(selected == false):
		print(" selected first:  "+ str(firstSelected))
		firstSelected = i
		selected= true


func swapper(i:int, f:int):
	emit_signal("swap",i,f)
