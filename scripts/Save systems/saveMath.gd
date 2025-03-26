extends Node

@export var m:mathsStorage
@export var s:stats
@export var iEB:TextEdit
@export var nameBox:TextEdit


func exportToClipboard():
	iEB.text = createDictionary()
	
	DisplayServer.clipboard_set(createDictionary())


func importFromIEB():
	import(iEB.text)


#helper functions
func import(s:String):
	pass

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
