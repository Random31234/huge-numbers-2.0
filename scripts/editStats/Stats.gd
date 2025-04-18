extends Node
class_name stats

@export var names:Array[String]
@export var values:Array[Big]
@export var statBox:VBoxContainer
@export var errorBox:TextEdit


@export var maths:mathsStorage
var na:Node2D
var statEntity = preload("res://scenes/StatEntity.tscn")
var swappable:bool

var firstSelected:int
var selected:bool

signal updateList(a:Array[String])
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	updateStats()
	emit_signal("updateList",names)




# Called every frame. 'delta' is the elapsed time since the previous frame.




#this function swaps the values, a helper function
func swapper(id1:int,id2:int):
	var v:Big
	
	@warning_ignore("shadowed_variable_base_class")
	var name:String
	
	name =names[id1]
	v = values[id1]
	names[id1] = names[id2]
	names[id2] = name
	values[id1] = values[id2]
	values[id2] =v
	updateStats()
	emit_signal("updateList",names)




#this function is to be called for updates, a helper function that will be called repeatedly to aid in the process.
func updateStats():
	
	for n in statBox.get_children():
		statBox.remove_child(n)
		n.queue_free()
		
	var z
	var i
	z =0
	for xyz in values:
		i = statEntity.instantiate()
		i.get_child(0).text = names[z] + " : " +values[z].toScientific()
		
		statBox.add_child(i)
		if(swappable == true):
			i.get_child(1).visible = true
			i.get_child(1).set_process(0)
			i.get_child(1).connect("button_down",swapFunction.bind(i.get_index(true)))
		if(swappable == false):
			i.get_child(1).visible = false
			i.get_child(1).set_process(4)
		
		z+=1
	emit_signal("updateList",names)

#the actual button functions as practiced is in here.
func swapFunction(i:int):
	
	if (selected == true):
		
		if(i < values.size() && firstSelected < values.size()):
			swapper(i, firstSelected)
			selected = false
			return
	if(selected == false):
		print(" selected first:  "+ str(firstSelected))
		firstSelected = i
		selected= true


func appendStat(b:Big,n:String):
	if(maths.searchStringInArrayB(maths.keywords,n) ):
		errorBox.text +='\n'+"Error name for new stat matches keyword, please use a different name"
		return
	if(maths.searchStringInArrayB(names,n)):
		errorBox.text +='\n'+"Error, name for new stat matches an existing stat name, please use a different name"
		return
	if(maths.searchStringInArrayB(maths.m.varNames,n)):
		
		errorBox.text +='\n'+ "Error, name for new matches an existing math's variable name, please refrain from creating a stat with the name of an existing variable."
		return
	
	
	names.append(n)
	
	values.append(b)
	updateStats()
	emit_signal("updateList",names)

func manipulateStat(index:int,funcIndex:int,b:Big):
	
	print(index)
	
	if(index != null && funcIndex != null && index != -1 && funcIndex !=-1 && b != null):
		
		
		if(funcIndex == 0):
			@warning_ignore("static_called_on_instance")
			values[index]=b.add(b,values[index])
		if(funcIndex == 1):
			@warning_ignore("static_called_on_instance")
			values[index]=b.subtract(values[index],b)
		if(funcIndex == 2):
			@warning_ignore("static_called_on_instance")
			values[index]=b.multiply(b,values[index])
		if(funcIndex == 3):
			@warning_ignore("static_called_on_instance")
			values[index]=b.divide(values[index],b)
		if(funcIndex == 4):
			@warning_ignore("static_called_on_instance")
			values[index]=b.power(values[index],b)
		if(funcIndex == 5):
			@warning_ignore("static_called_on_instance")
			values[index]=b.power(values[index], b.divide(1,b))
		if(funcIndex == 6):
			values[index]=b
		if(funcIndex == 7):
			
			values.remove_at(index)
			names.remove_at(index)
			emit_signal("updateList",names)
	updateStats()
	emit_signal("updateList",names)


func swappableT(b:bool):
	swappable = b
	updateStats()
	emit_signal("updateList",names)
