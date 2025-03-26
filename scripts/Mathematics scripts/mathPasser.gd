extends Control

signal setVariable(b:Big,n:String,i:int)
signal delete(i:int)
signal varUpdate(b:Array[Big],n:Array[String],s:bool)
signal swap(i:int,f:int)


signal exC(c:String)
signal setC(c:String)
func setV(b:Big,n:String,i:int):
	emit_signal("setVariable",b,n,i)

func deleteV(i:int):
	emit_signal("delete", i)


func varUpdates(b:Array[Big],n:Array[String],s:bool):
	emit_signal("varUpdate",b,n,s)
	print("var update sent to objects")

func passSwap(i:int, f:int):
	emit_signal("swap",i,f)

func setCalc(c:String):
	emit_signal("setC",c)

func displayCalc(c:String):
	emit_signal("exC",c)
