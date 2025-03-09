extends Node
class_name stats

@export var names:Array[String]
@export var values:Array[Big]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
