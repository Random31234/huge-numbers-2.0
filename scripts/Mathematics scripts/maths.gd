extends Node
class_name mathsStorage
@export var maths:Array[math]
@export var m:math
@export var stat:stats
@export var keywords:Array[String]
@export var i:int
@export var swappable:bool
@export var textBox:TextEdit
var b:Big
signal vars(b:Array[Big],n:Array[String],s:bool)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#test function
	#var vale =math.new()
	#var be:Array[Big]
	#be.append(Big.new(1,2))
	#be.append(Big.new(1,3))
	#vale.varVal = b
	#maths.append(vale)
	m = math.new()
	updateVarOptions()
	pass


func searchForMath(s:String)->math:
	
	for x in maths:
		
		if (x.name == s):
			return x
	
	return m

func updateVarOptions():
	
	emit_signal("vars",m.varVal,m.varNames,swappable)


func setVariable(b:Big,n:String,i:int):
	#conditions to go through first
	if(searchStringInArray(m.varNames,n)):
		if(m.varNames.size() <=i):
			
			textBox.text += '\n'+"Error, var name exists already, please use a different name"
			return
		if(m.varNames[i] != n):
			
			textBox.text +='\n' +"Error, var name exists already, please use a different name"
			return
	if(searchStringInArray(stat.names,n)):
		
		
		textBox.text +='\n' +"Error, stat name exists already, please use a different name for the variable"
		return
	
	if(searchStringInArray(keywords,n)):
		
		
		textBox.text += '\n' +"Error, attempted to create a variable that has the same name as a keyword, please use different var name"
		return
	print(n)
	print(m.varVal.size())
	print(i)
	if(m.varVal.size() <=i):
		print("appending values")
		
		m.varNames.append(n)
		m.varVal.append(b)
		updateVarOptions()
		return
	print("editing existing value")
	m.varNames[i] = n
	m.varVal[i] = b
	updateVarOptions()

func deleteVariable(i:int):
	
	if(m.varVal.size()-1 <i):
		return
	m.varNames.remove_at(i)
	m.varVal.remove_at(i)
	updateVarOptions()


func _on_maths_swap(i: int, f: int) -> void:
	pass # Replace with function body.

func swappableT(b:bool):
	swappable = b
	updateVarOptions()


func performActiveMathematics():
	performCalculation(m)
	pass


#helper functions

func performCalculation(ma:math):
	
	#get logic here.
	
	updateVarOptions()
	

func searchStringInArray(a:Array,s:String):
	if a.size() <=0:
		return false
	for x in a:
		if x == s:
			return true
	
	return false
