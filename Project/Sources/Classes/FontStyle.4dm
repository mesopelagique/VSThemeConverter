Class extends Object

Class constructor($object : Object)
	
	If (Count parameters:C259>0)
		This:C1470.bold:=Bool:C1537($object.bold)
		This:C1470.italic:=Bool:C1537($object.italic)
		This:C1470.underline:=Bool:C1537($object.underline)
	Else 
		This:C1470.bold:=False:C215
		This:C1470.italic:=False:C215
		This:C1470.underline:=False:C215
	End if 