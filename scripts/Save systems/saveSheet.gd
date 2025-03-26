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
	for z in d["variables"]:
		print(z)
		m.m.varNames.append(z)
		m.m.varVal.append(Big.new(d["variables"][z]))
	
	
	m.emit_signal("calcUpdate",m.m.calculation)
	m.updateVarOptions()



func updateSheetsList():
	pass
	for z in m.maths:
		pass

func createDictionary():
	var d:Dictionary
	var x
	x = 0
	d["stats"] = {}




# Get the current contents of the clipboard
#var current_clipboard = DisplayServer.clipboard_get()
# Set the contents of the clipboard
#DisplayServer.clipboard_set("Paste Me!")
