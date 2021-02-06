Class extends Object

Class constructor($object : Variant)
	
	Case of 
		: (Count parameters:C259=0)
			This:C1470.bold:=False:C215
			This:C1470.italic:=False:C215
			This:C1470.underline:=False:C215
		: (Value type:C1509($object)=Is object:K8:27)
			This:C1470.bold:=Bool:C1537($object.bold)
			This:C1470.italic:=Bool:C1537($object.italic)
			This:C1470.underline:=Bool:C1537($object.underline)
		: (Value type:C1509($object)=Is text:K8:3)
			This:C1470.bold:=Position:C15("bold"; $object)>0
			This:C1470.italic:=Position:C15("italic"; $object)>0
			This:C1470.underline:=Position:C15("underline"; $object)>0
		Else 
			This:C1470.bold:=False:C215
			This:C1470.italic:=False:C215
			This:C1470.underline:=False:C215
	End case 