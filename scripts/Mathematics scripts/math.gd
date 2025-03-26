extends Resource
class_name math
@export var varNames:Array[String]
@export var varVal:Array[Big]
@export var calculation:String
@export var name:String
# Called when the node enters the scene tree for the first time.
func _init(names:Array[String], val:Array[Big], calculations:String,nameO:String) -> void:
	varNames = names
	varVal = val
	calculation = calculations
	name = nameO




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
