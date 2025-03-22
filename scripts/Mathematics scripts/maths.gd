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
#temp vars that can be used accordingly
var tempVar1:Big
var tempVar2:Big
var tempVar3:Big
var tempVar4:Big
var tempVar5:Big




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
	if(searchStringInArrayB(m.varNames,n)):
		if(m.varNames.size() <=i):
			
			textBox.text += '\n'+"Error, var name exists already, please use a different name"
			return
		if(m.varNames[i] != n):
			
			textBox.text +='\n' +"Error, var name exists already, please use a different name"
			return
	if(searchStringInArrayB(stat.names,n)):
		
		
		textBox.text +='\n' +"Error, stat name exists already, please use a different name for the variable"
		return
	
	if(searchStringInArrayB(keywords,n)):
		
		
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


#adjust this function for later

#func performActiveMathematics():
#	performCalculation(m)
#	pass


#helper functions

func performCalculation(input:Big,maths:String):
	var x =0
	#get logic here.
	
	print(input.toScientific())
	
	print(maths)
	var g:PackedStringArray
	g = maths.split(" ", false)
	#make sure to make note on new lines to add a space before.
	print(g[1])
	calcThroughSteps(input,g)
	updateVarOptions()
	

func calcThroughSteps(input:Big,g:PackedStringArray):
	var t:Big
	t = Big.new(0,0)
	for x in g:
		pass
	
	pass



#helper functions

func searchStringInArrayB(a:Array,s:String):
	if a.size() <=0:
		return false
	for x in a:
		if x == s:
			return true
	
	return false

func searchStringInArrayI(a:Array,s:String):
	if a.size() <=0:
		return -1
	var z =0
	for x in a:
		
		if x == s:
			return z
		z+=1
	
	return -1

func systematicremoval(a:Array[String], s:String):
	var x =0
	for g in a:
		if g == s:
			a.remove_at(x)
			systematicremoval(a,s)
			return
		x+=1
