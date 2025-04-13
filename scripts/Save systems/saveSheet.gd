extends Node

@export var s:stats
@export var m:mathsStorage
@export var iEB:TextEdit
@export var nameBox:TextEdit
@export var sheetsOptions:OptionButton
@export var mathsSave:Node
@export var textBox:TextEdit
const savePath:String = "user://HugeNumbersSheets/"
const sheetNamesFile:String = "user://Names.txt"
@export var sheetNames:PackedStringArray

func _ready() -> void:
	loadSheetNames()


func exportToClipboard():
	
	
	iEB.text = createDictionary()
	
	DisplayServer.clipboard_set(createDictionary())

func importFromIEB():
	import(iEB.text)


#the file manipulations


#this deletes the sheet
func deleteSheet():
	sheetNames.remove_at(sheetsOptions.selected)
	DirAccess.remove_absolute(savePath+sheetsOptions.text+".txt")
	updateSheetNames()

#this loads a sheet
func loadSheet():
	var f = FileAccess.open(savePath+sheetsOptions.text+".txt", FileAccess.READ)
	if not f:
		print("file not detected")
		#this should be the basis for creating the tutorial sheet
		return
	if f == null:
		print("file is null")
		return
	
	var content = f.get_as_text()
	import(content)


func saveToSheet():
	
	DirAccess.make_dir_absolute(savePath)
	var fil = FileAccess.open(savePath+sheetsOptions.text+".txt",FileAccess.WRITE)
	fil.store_string(createDictionary())
	sheetNames.append(nameBox.text)
	updateSheetNames()

func saveNewSheet():
	DirAccess.make_dir_absolute(savePath)
	if(m.searchStringInArrayB(sheetNames,nameBox.text)):
		
		textBox.text += "Error, sheet name is invalid"
		return
	if(nameBox.text == ""):
		textBox.text += "Error, do not use an empty name for maths."
		return
	if(nameBox.text.contains(" ")):
		textBox.text += "Do not add spaces to math name"
		return
	var fil = FileAccess.open(savePath+nameBox.text+".txt",FileAccess.WRITE)
	fil.store_string(createDictionary())
	sheetNames.append(nameBox.text)
	updateSheetNames()






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



#creates a dictionary in string form
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

func updateSheetNames():
	sheetsOptions.clear()
	for j in sheetNames:
		sheetsOptions.add_item(j)
	
	var d:Dictionary
	var x
	x= 0
	for y in sheetNames:
		d[x] = y
		x+=1
	var jstr = JSON.stringify(d)
	print(jstr)
	var f =FileAccess.open(sheetNamesFile,FileAccess.WRITE)
	f.store_string(jstr)

func loadSheetNames():
	var f = FileAccess.open(sheetNamesFile,FileAccess.READ)
	if not f:
		print("file not detected")
		#this should be the basis for creating the tutorial sheet
		
		return
	if f == null:
		print("file is null")
		return
	var jstr = f.get_as_text()
	var d =JSON.parse_string(jstr)
	
	for x in d:
		sheetNames.append(d[x])
	updateSheetNames()

# Get the current contents of the clipboard
#var current_clipboard = DisplayServer.clipboard_get()
# Set the contents of the clipboard
#DisplayServer.clipboard_set("Paste Me!")
