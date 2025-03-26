extends Control


@export var s:stats

@export var g:TextEdit


func displayStats():
	var x = 0
	for j in s.values:
		
		g.text += s.names[x] + ": " + j.toScientific() + '\n'
		
		x+=1
		
