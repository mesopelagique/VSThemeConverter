Class extends Object

Class constructor($object : Object)
	
	If (Count parameters:C259>0)
		This:C1470.color:=cs:C1710.Color.new($object)  // no sub level
		If ($object["style"]#Null:C1517)
			This:C1470.style:=cs:C1710.FontStyle.new($object["style"])
		End if 
	End if 
	
	
	
Function toObject()->$obj : Object
	$obj:=New object:C1471()
	If (This:C1470.style#Null:C1517)
		$obj.style:=This:C1470.style
	End if 
	If (This:C1470.color#Null:C1517)
		If (Value type:C1509(This:C1470.color)=Is object:K8:27)
			$obj.color:=This:C1470.color.hexa
		Else 
			$obj.color:=This:C1470.color
		End if 
	End if 