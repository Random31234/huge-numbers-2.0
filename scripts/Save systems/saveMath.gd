extends Node

@export var m:mathsStorage
@export var s:stats
@export var iEB:TextEdit
@export var nameBox:TextEdit
@export var mathsOptions:OptionButton

func exportToClipboard():
	
	
	iEB.text = createDictionary()
	
	DisplayServer.clipboard_set(createDictionary())


func importFromIEB():
	import(iEB.text)

func deleteMath():
	m.maths.remove_at(mathsOptions.selected)


#helper functions
func import(e:String):
	
	var d = JSON.parse_string(e)
	m.m.calculation = d["calc"]
	m.m.name = d["name"]
	m.m.varNames.clear()
	m.m.varVal.clear()
	for z in d["variables"]:
		print(z)
		m.m.varNames.append(z)
		m.m.varVal.append(Big.new(d["variables"][z]))
	
	
	m.emit_signal("calcUpdate",m.m.calculation)
	m.updateVarOptions()




func createDictionary():
	var d:Dictionary
	var x
	x = 0
	d["variables"] = {}
	
	for z in m.m.varNames:
		
		d["variables"][z] = m.m.varVal[x].toScientific()
		x+=1
	print(d)
	d["name"] = m.m.name 
	d["calc"] = m.m.calculation
	print(d)
	var jstr =JSON.stringify(d)
	print(jstr)
	return jstr
