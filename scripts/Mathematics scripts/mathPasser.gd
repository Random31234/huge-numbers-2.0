extends Control

signal setVariable(b:Big,n:String,i:int)
signal delete(i:int)
signal varUpdate(b:Array[Big],n:Array[String],s:bool)
signal swap(i:int,f:int)

signal updateCalc(s:String)
func setV(b:Big,n:String,i:int):
	emit_signal("setVariable",b,n,i)

func deleteV(i:int):
	emit_signal("delete", i)


func varUpdates(b:Array[Big],n:Array[String],s:bool,c:String):
	emit_signal("varUpdate",b,n,s,c)
	print("var update sent to objects")

func passSwap(i:int, f:int):
	emit_signal("swap",i,f)



func updateCalculations(s:String):
	emit_signal("updateCalc",s)
