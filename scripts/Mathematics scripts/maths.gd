extends Node
class_name mathsStorage
@export var maths:Array[math]
@export var m:math
@export var stat:stats
@export var keywords:Array[String]
@export var i:int
@export var swappable:bool
@export var textBox:TextEdit



@export var backlog:Dictionary
var b:Big
#temp vars that can be used accordingly
var tempVar1:Big
var tempVar2:Big
var tempVar3:Big
var tempVar4:Big
var tempVar5:Big

var braceCounter:int



signal vars(b:Array[Big],n:Array[String],s:bool)
signal calcUpdate(s:String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var lig = Big.new(5,0)
	var li = 2
	var l = Big.new(1,0)
	print(l.modulo(lig,li).toScientific())
	#test function
	#var vale =math.new()
	#var be:Array[Big]
	#be.append(Big.new(1,2))
	#be.append(Big.new(1,3))
	#vale.varVal = b
	#maths.append(vale)
	m = math.new([],[],"","")
	tempVar1 = Big.new(0,0)
	tempVar2 = Big.new(0,0)
	tempVar3 = Big.new(0,0)
	tempVar4 = Big.new(0,0)
	tempVar5 = Big.new(0,0)
	updateVarOptions()
	pass


func searchForMath(s:String)->math:
	
	for x in maths:
		
		if (x.name == s):
			return x
	
	return m

func updateVarOptions():
	
	emit_signal("vars",m.varVal,m.varNames,swappable)


func setVariable(d:Big,n:String,i:int):
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
		m.varVal.append(d)
		updateVarOptions()
		return
	print("editing existing value")
	m.varNames[i] = n
	m.varVal[i] = d
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
	
	var g:PackedStringArray
	g = maths.split(" ", false)
	b = input
	m.calculation = maths
	#make sure to make note on new lines to add a space before.
	calcThroughSteps(g)
	updateVarOptions()
	stat.updateStats()
	

func calcThroughSteps(g:PackedStringArray):
	#note b = input
	var symbol:String
	symbol = ""
	var valueSet:bool
	var braceCounter:int
	braceCounter = 0
	valueSet =false
	var isIf:bool
	isIf = false
	var isSkipping:bool
	isSkipping = false
	var t:Big
	
	var values:Array[Big]
	var names:Array[String]
	var ma:String
	ma = ""
	print("Start loop through")
	print(g.size())
	var f = 0
	print("end loop through")
	print(f)
	braceCounter = 0
	t = Big.new(0,0)
	cleanUpArray(g, '\n')
	for x in g:
		print(x)
		print(isSkipping)
		if(isSkipping == true):
			
			if(x == "{"):
				braceCounter +=1
			if(x == "}"):
				braceCounter -=1
				if(braceCounter == 0):
					isSkipping = false
			
			continue
		if( x == "{"):
			continue
		if(x == "}"):
			continue
		print(searchStringInArrayI(keywords,x))
		
		if x == "end":
			break
		
		if symbol == "exe":
			b = getBig(x)
			var h:PackedStringArray
			h = ma.split(" ", false)
			calcThroughSteps(h)
			
			m.varNames = names
			m.varVal = values
			symbol = ""
		
		
		if(symbol == "execute"):
			for z in maths:
				if(z.name == x):
					
					symbol = "exe"
					ma = z.calculation
					values = m.varVal
					names = m.varNames
					m.varNames = z.varNames
					m.varVal = z.varVal
			
			if(symbol == "exe"):
				continue
			
			symbol = ""
			continue
		
		
		if(x == "execute"):
			symbol = "execute"
			continue
		
		if(x == "print"):
			symbol = "print"
			continue
		print("symbol is: "+symbol)
		if(symbol == "print"):
			print(x.contains('\n'))
			print("detected big: " + str(checkBig(x)))
			print(x + ": " + getBig(x).toScientific())
			textBox.text += x + ": " + getBig(x).toScientific()+ " "
			symbol = ""
			continue
		
		print(t.toScientific())
		if(valueSet == false):
			if (searchStringInArrayB(m.varNames,x)):
				t = getBig(x)
				valueSet = true
				continue
			if (searchStringInArrayB(stat.names,x)):
				t = getBig(x)
				valueSet = true
				
				continue
			if(searchStringInArrayI(keywords,x) <=5 && searchStringInArrayI(keywords,x)>=0):
				t = getBig(x)
				valueSet = true
				continue
		if(valueSet == true):
			
			if(searchStringInArrayI(keywords,symbol) <15 && searchStringInArrayI(keywords,symbol) >= 10):
				valueSet = false
				if(comparator(t, symbol,x)):
					print("condition is true!")
					symbol = ""
					continue
				symbol = ""
				isSkipping = true
			if(searchStringInArrayI(keywords,symbol) >=15):
				t =doStep(t,symbol,x)
				
				if(symbol == "="):
					valueSet = false
					symbol = ""
					continue
				symbol = ""
			if(symbol == ""):
				if(searchStringInArrayI(keywords,x)>6):
					symbol = x
					print(symbol)
			
	pass



#helper functions

func doStep(t:Big,s:String,x:String):
	print("Doing step")
	print(t.toScientific() + ":t, " + '\n')
	#work on neutralizer equations
	if(checkBig(x) == false):
		return t
	if(checkBig(x) == true):
		if(s == "+"):
			print(" adding t: " + t.toScientific() + " and x: " + getBig(x).toScientific())
			t =t.add(t,getBig(x))
			
			print( "output of add " +t.toScientific())
			return t
		if(s == "-"):
			t = t.subtract(t,getBig(x))
			return t
		if(s == "*"):
			t = t.multiply(t,getBig(x))
			return t
		if (s == "/"):
			t = t.divide(t,getBig(x))
			return t
		if (s == "^"):
			t =t.power(t,getBig(x))
			return t
		if(s == "√"):
			t =t.power(t,t.divide(1,getBig(x)))
			return t
		if(s == "~"):
			t = t.BigRandomizer(t,getBig(x))
			return t
		if(s == "="):
			setBig(x,t)
			print("setting equal to " + t.toScientific())
			print(getBig(x).toScientific())
			return t
		
		if(s == "modulo"):
			t = t.modulo(t,getBig(x))
			print("modulo result: " + t.toScientific())
			return t
	s =""
	

func comparator(t:Big,s:String,x:String):
	if(checkBig(x) == false):
		return false
	if(checkBig(x) == true):
		if(s== "=="):
			if(t.isEqualTo(getBig(x))):
				return true
		if(s== ">="):
			if(t.isGreaterThanOrEqualTo(getBig(x))):
				return true
		if(s== "<="):
			if(t.isLessThanOrEqualTo(getBig(x))):
				return true
		if(s== "<"):
			if(t.isLessThan(getBig(x))):
				return true
		if(s== ">"):
			if(t.isGreaterThan(getBig(x))):
				return true
	return false

func setMath(s:String):
	m.calculation = s



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


func checkBig(s:String):
	if(searchStringInArrayI(keywords,s)==4):
		return true
	if(searchStringInArrayI(keywords,s)==3):
		return true
	if(searchStringInArrayI(keywords,s)==2):
		return true
	if(searchStringInArrayI(keywords,s)==1):
		return true
	if(searchStringInArrayI(keywords,s)==0):
		return true
	if(searchStringInArrayI(keywords,s)==5):
		return true
	
	if(searchStringInArrayI(stat.names, s)!= -1):
		return true
	if(searchStringInArrayI(m.varNames, s)!= -1):
		return true
	return false
	



func getBig(s:String):
	if(searchStringInArrayI(keywords,s)==4):
		return tempVar5
	if(searchStringInArrayI(keywords,s)==3):
		return tempVar4
	if(searchStringInArrayI(keywords,s)==2):
		return tempVar3
	if(searchStringInArrayI(keywords,s)==1):
		return tempVar2
	if(searchStringInArrayI(keywords,s)==0):
		return tempVar1
	if(searchStringInArrayI(keywords,s)==5):
		return b
	
	if(searchStringInArrayI(stat.names, s)!= -1):
		return stat.values[searchStringInArrayI(stat.names,s)]
	if(searchStringInArrayI(m.varNames, s)!= -1):
		return m.varVal[searchStringInArrayI(m.varNames,s)]
	return Big.new(0,0)
	

func cleanUpArray(a:PackedStringArray,s:String):
	var f =0
	for t in a:
		
		
		if t == s:
			a.remove_at(f)
			cleanUpArray(a,s)
		if t.contains(s):
			t.replace('\n',"")
		f+=1

func setBig(s:String,y:Big):
	if(searchStringInArrayI(keywords,s)==4):
		tempVar5 =y
	if(searchStringInArrayI(keywords,s)==3):
		tempVar4 =y
	if(searchStringInArrayI(keywords,s)==2):
		tempVar3 =y
	if(searchStringInArrayI(keywords,s)==1):
		tempVar2 =y
	if(searchStringInArrayI(keywords,s)==0):
		tempVar1 =y
	if(searchStringInArrayI(keywords,s)==5):
		b =y
	
	if(searchStringInArrayI(stat.names, s)!= -1):
		stat.values[searchStringInArrayI(stat.names,s)] = y
	if(searchStringInArrayI(m.varNames, s)!= -1):
		m.varVal[searchStringInArrayI(m.varNames,s)] =y
	pass
