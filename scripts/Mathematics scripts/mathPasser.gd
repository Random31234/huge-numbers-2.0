extends Control

signal setVariable(b:Big,n:String,i:int)
signal delete(i:int)
signal varUpdate(b:Array[Big],n:Array[String],s:bool)
func setV(b:Big,n:String,i:int):
	emit_signal("setVariable",b,n,i)

func deleteV(i:int):
	emit_signal("delete", i)


func varUpdates(b:Array[Big],n:Array[String],s:bool):
	emit_signal("varUpdate",b,n,s)
