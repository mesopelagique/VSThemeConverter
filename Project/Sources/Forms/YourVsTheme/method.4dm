

Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		
		$dst:=Folder:C1567(fk editor theme folder:K87:23)
		$folder:=Folder:C1567(fk user preferences folder:K87:10).parent.folder("Code/CachedExtensionVSIXs")
		
		Form:C1466.themes:=New collection:C1472()
		For each ($file; $folder.files())
			
			If (Length:C16($file.name)>0)
				$archive:=ZIP Read archive:C1637($file)
				For each ($theme; FindVSThemeFiles($archive.root; 4))
					Form:C1466.themes.push(New object:C1471("archive"; $archive; "theme"; $theme; "bgColor"; Choose:C955($dst.file($theme.fullName).exists; "#F29957"; "")))
				End for each 
			End if 
		End for each 
		
	Else 
		// not managed
End case 