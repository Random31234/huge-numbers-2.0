extends TextEdit

signal updateValue(s:String)



func updateVal():
	emit_signal("updateValue",self.text)
	
	


func setText(s:String):
	self.text = s
