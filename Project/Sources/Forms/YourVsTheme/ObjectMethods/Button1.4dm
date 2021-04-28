

Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		var $dst : 4D:C1709.Folder
		$dst:=Folder:C1567(fk editor theme folder:K87:23)
		var $theme : Object
		For each ($theme; Form:C1466.selected)
			Convert($theme.theme; $dst/*.folder($folder.name)*/)
		End for each 
		
		CONFIRM:C162("Reveal in Finder")
		If (OK=1)
			SHOW ON DISK:C922($dst.platformPath)
		End if 
End case 