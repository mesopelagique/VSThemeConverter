

Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		
		$dst:=Folder:C1567(fk editor theme folder:K87:23)
		
		For each ($theme; Form:C1466.themes)
			Convert($theme.theme; $dst/*.folder($folder.name)*/)
		End for each 
		
		CONFIRM:C162("Reveal in Finder")
		If (OK=1)
			SHOW ON DISK:C922($dst.platformPath)
		End if 
End case 