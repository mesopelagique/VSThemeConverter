

Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		var $dst; $folder : 4D:C1709.Folder
		$dst:=Folder:C1567(fk editor theme folder:K87:23)
		$folder:=Folder:C1567(fk user preferences folder:K87:10).parent.folder("Code/CachedExtensionVSIXs")
		
		Form:C1466.themes:=New collection:C1472()
		var $file : 4D:C1709.File
		For each ($file; $folder.files())
			
			If (Length:C16($file.name)>0)
				var $archive : 4D:C1709.ZipArchive
				$archive:=ZIP Read archive:C1637($file)
				var $theme : Object
				For each ($theme; FindVSThemeFiles($archive.root; 4))
					
					var $converted : Boolean
					$converted:=$dst.file($theme.fullName).exists
					
					If (Not:C34($converted))
						If ($theme.fullName="defaultTheme.json")
							$parent:=$theme.parent
							While ($parent#Null:C1517)
								$lastparent:=$parent
								$parent:=$parent.parent
							End while 
							If ($lastparent#Null:C1517)
								$converted:=$dst.file($lastparent.fullName+".json").exists
							End if 
						End if 
					End if 
					
					Form:C1466.themes.push(New object:C1471("archive"; $archive; "theme"; $theme; "bgColor"; Choose:C955($converted; "#f29957"; Null:C1517)))
				End for each 
			End if 
		End for each 
		
	Else 
		// not managed
End case 