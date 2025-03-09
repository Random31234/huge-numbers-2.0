extends Node
@export var maths:Array[math]
@export var m:math
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#test function
	#var vale =math.new()
	#var b:Array[Big]
	#b.append(Big.new(1,2))
	#b.append(Big.new(1,3))
	#vale.varVal = b
	#maths.append(vale)
	pass


func searchForMath(s:String)->math:
	
	for x in maths:
		
		if (x.name == s):
			return x
	
	return m


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
