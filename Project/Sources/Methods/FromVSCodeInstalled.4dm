//%attributes = {}



$folder:=Folder:C1567(fk user preferences folder:K87:10).parent.folder("Code/CachedExtensionVSIXs")

For each ($file; $folder.files())
	
	If (Length:C16($file.name)>0)
		$archive:=ZIP Read archive:C1637($file)
		
		For each ($theme; FindJSONTheme($archive.root; 4))
			
			
		End for each 
	End if 
	
	
End for each 