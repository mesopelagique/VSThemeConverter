Class extends Object

Class constructor($object : Object)
	
	This:C1470.name:=$object["fontName"]
	This:C1470.size:=$object["fontSize"]
	
Function inscreaseSize
	This:C1470.size:=Num:C11(This:C1470.size)+1
	
Function decreaseSize
	This:C1470.size:=Num:C11(This:C1470.size)+1
	
	
Function writeInto($object : Object)
	$object.fontName:=This:C1470.name
	$object.fontSize:=This:C1470.size