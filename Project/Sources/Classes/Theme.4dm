Class extends Object

Class constructor($object : Object)
	
	This:C1470.font:=cs:C1710.Font.new($object)  // not well mapped because font has not its subnode unfortunately
	
	This:C1470["4D"]:=cs:C1710.Language4D.new($object["4D"])
	This:C1470["JSON"]:=cs:C1710.LanguageJSON.new($object["JSON"])
	This:C1470["SQL"]:=cs:C1710.LanguageSQL.new($object["SQL"])
	This:C1470["otherStyles"]:=cs:C1710.Styles.new($object["otherStyles"])
	This:C1470["__inheritedFrom__"]:=$object["__inheritedFrom__"]
	
	
Function toObject()->$object : Object
	
	$object:=New object:C1471()
	If (This:C1470.font#Null:C1517)
		This:C1470.font.writeInto($object)
	End if 
	$object["4D"]:=This:C1470["4D"].toObject()
	$object["JSON"]:=This:C1470["JSON"].toObject()
	$object["SQL"]:=This:C1470["SQL"].toObject()
	$object["otherStyles"]:=This:C1470["otherStyles"].toObject()
	
	$object["__inheritedFrom__"]:=This:C1470["__inheritedFrom__"]