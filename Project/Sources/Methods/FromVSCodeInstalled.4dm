//%attributes = {}



$dst:=Folder:C1567(fk editor theme folder:K87:23)
$folder:=Folder:C1567(fk user preferences folder:K87:10).parent.folder("Code/CachedExtensionVSIXs")

$vsTheme:=New collection:C1472()
For each ($file; $folder.files())
	
	If (Length:C16($file.name)>0)
		$archive:=ZIP Read archive:C1637($file)
		For each ($theme; FindVSThemeFiles($archive.root; 4))
			$vsTheme.push($theme)
		End for each 
	End if 
End for each 

For each ($theme; $vsTheme)
	Convert($theme; $dst/*.folder($folder.name)*/)
End for each 
SHOW ON DISK:C922($dst.platformPath)