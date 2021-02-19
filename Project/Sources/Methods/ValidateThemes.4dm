//%attributes = {}


$schema:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("themeSchemas.json").getText())

$success:=New object:C1471()
$failure:=New object:C1471()
For each ($file; Folder:C1567(fk editor theme folder:K87:23).files())
	
	If ($file.extension=".json")
		$theme:=JSON Parse:C1218($file.getText())
		
		If ($theme["JSON"]=Null:C1517)
			$theme["JSON"]:=New object:C1471()
		End if 
		
		OB REMOVE:C1226($theme["otherStyles"]; "matching_parenthesis_back_color")
		
		$result:=JSON Validate:C1456($theme; $schema)
		If ($result.success)
			$success[$file.name]:=$result
		Else 
			$failure[$file.name]:=$result
		End if 
	End if 
	
End for each 

$withErrors:=OB Keys:C1719($failure)

ASSERT:C1129($withErrors.length=0; $withErrors.join(","))

