Class extends Object

Class constructor($object : Object)
	var $key : Text
	For each ($key; $object)
		This:C1470[$key]:=cs:C1710.Style.new($object[$key])
		//This[$key].name:=$key
	End for each 
	
Function toObject()->$obj : Object
	$obj:=New object:C1471()
	var $key : Text
	For each ($key; This:C1470)
		If (This:C1470[$key]#Null:C1517)
			If (This:C1470[$key].toObject#Null:C1517)
				$obj[$key]:=This:C1470[$key].toObject()
			Else 
				$obj[$key]:=This:C1470[$key]
			End if 
		End if 
	End for each 