extends varBase


@export var numText:TextEdit

func pressed():
	var b:Big
	
	
	b = Big.new(numText.text)
	
	emit_signal("setVariable",b,nameBox.text,opt.selected)
