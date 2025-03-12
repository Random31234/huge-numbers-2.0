extends Node
class_name stats

@export var names:Array[String]
@export var values:Array[Big]
@export var statBox:VBoxContainer

var statEntity = preload("res://scenes/StatEntity.tscn")
var swappable:bool


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
	v = values[id2]
	names[id1] = names[id2]
	names[id2] = name
	values[id1] = values[id2]
	values[id2] =v


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
		
		
		if(swappable == true):
			i.get_child(1).visibility = true
			i.get_child
		if(swappable == false):
			i.get_child(1).visibility = false
			i.get_child(1)
			
		z+=1
		
