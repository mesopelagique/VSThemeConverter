//%attributes = {}
#DECLARE($fontName : Text; $fontSize : Integer)

If (Shift down:C543)
	$fontName:=Request:C163("Font Name")
	$fontSize:=Num:C11(Request:C163("Font Size"))
End if 

If ($fontSize<1)
	$fontSize:=12
End if 

If (Length:C16($fontName)>0)
	
	For each ($themeFile; Folder:C1567(fk editor theme folder:K87:23).files())
		
		If ($themeFile.extension=".json")
			
			$theme:=JSON Parse:C1218($themeFile.getText())
			If ($theme["4D"]#Null:C1517)  // is 4d file
				
				$theme.fontName:=$fontSize
				$theme.fontSize:=$fontSize
				
			End if 
		End if 
		
	End for each 
End if 