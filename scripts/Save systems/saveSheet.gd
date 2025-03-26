extends Node

@export var s:stats
@export var m:mathsStorage
@export var iEB:TextEdit
@export var nameBox:TextEdit
@export var sheetsOptions:OptionButton
@export var mathsSave:Node

func exportToClipboard():
	
	
	iEB.text = createDictionary()
	
	DisplayServer.clipboard_set(createDictionary())

func importFromIEB():
	import(iEB.text)

func deleteSheet():
	pass


func loadSheet():
	pass

func saveToSheet():
	pass


func saveNewSheet():
	pass

func import(e:String):
	
	var d = JSON.parse_string(e)
	var h:Dictionary
	
	if(d.has("stats")):
		s.names.clear()
		s.values.clear()
		for z in d["stats"]:
			s.names.append(z)
			s.values.append(Big.new(d["stats"][z]))
	if(d.has("maths")):
		m.maths.clear()
		var st:Array[String]
		var b:Array[Big]
		for z in d["maths"]:
			m.m.name = z
			for y in d["maths"][z]:
				if(y == "calc"):
					m.m.calculation = d["maths"][z][y]
					continue
				st.append(y)
				b.append(Big.new(d["maths"][z][y]))
			m.m = math.new(st,b,m.m.calculation,m.m.name)
			m.maths.append(m.m)
	
	m.emit_signal("calcUpdate",m.m.calculation)
	m.updateVarOptions()
	s.updateStats()
	mathsSave.updateMathsList()



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
		d["stats"][z] = s.values[x].toScientific()
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
