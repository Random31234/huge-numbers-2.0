extends Node
class_name stats

@export var names:Array[String]
@export var values:Array[Big]
@export var statBox:VBoxContainer
var na:Node2D
var statEntity = preload("res://scenes/StatEntity.tscn")
var swappable:bool

var firstSelected:int
var selected:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func swappableT(b:bool):
	swappable = b
	updateStats()

#this function swaps the values.
func swapper(id1:int,id2:int):
	var v:Big
	
	var name:String
	
	name =names[id1]
	v = values[id1]
	names[id1] = names[id2]
	names[id2] = name
	values[id1] = values[id2]
	values[id2] =v
	updateStats()





#this function is to be called for updates.
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
		
		
		
