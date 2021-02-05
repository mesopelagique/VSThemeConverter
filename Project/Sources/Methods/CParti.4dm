//%attributes = {}
var $dst : 4D:C1709.Folder
If (Shift down:C543)
	$dst:=Folder:C1567(fk resources folder:K87:11).folder("4d")
Else 
	$dst:=Folder:C1567(fk editor theme folder:K87:23)
End if 

If (Not:C34($dst.exists))
	$dst.create()
End if 

$col:=Folder:C1567(fk resources folder:K87:11).folder("vs").folders()
$col.push(Folder:C1567(fk resources folder:K87:11).folder("vs"))
For each ($folder; $col)
	
	$files:=FindJSONTheme($folder)
	For each ($file; $files)
		Convert($file; $dst/*.folder($folder.name)*/)
	End for each 
	
End for each 

SHOW ON DISK:C922($dst.platformPath)

