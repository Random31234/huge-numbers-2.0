extends Resource
class_name math
@export var varNames:Array[String]
@export var varVal:Array[Big]
@export var calculation:String
@export var name:String
# Called when the node enters the scene tree for the first time.
func _ready(names:Array[String], val:Array[Big], calculations:String) -> void:
	varNames = names
	varVal = val
	calculation = calculations




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
