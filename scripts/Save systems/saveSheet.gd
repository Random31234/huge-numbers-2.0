extends Node

@export var s:stats
@export var m:mathsStorage
@export var iEB:TextEdit
@export var nameBox:TextEdit
@export var sheetsOptions:OptionButton




func importFromIEB():
	import(iEB.text)

func deleteMath():
	pass


func loadMath():
	pass

func saveToMath():
	pass


func saveNewMath():
	pass

func import(e:String):
	
	var d = JSON.parse_string(e)
	



func updateSheetsList():
	pass
	for z in m.maths:
		pass

func createDictionary():
	var d:Dictionary
	var x
	x = 0
	d["stats"] = {}
	for z in s.names:
		d["Stats"][z] = s.values[x].toScientific()
		x+=1
	print(d)
	d["maths"] = {}
	x = 0
	for z in m.maths:
		d["maths"][z.name] = {}
		for y in z.varNames:
			d["maths"][z.name][y] = z.varVal[x].toScientific()
			x+=1
		d["maths"][z.name]["calc"] = z.calculation
	print(d)
	var jstr =JSON.stringify(d)
	print(jstr)
	return jstr



# Get the current contents of the clipboard
#var current_clipboard = DisplayServer.clipboard_get()
# Set the contents of the clipboard
#DisplayServer.clipboard_set("Paste Me!")
