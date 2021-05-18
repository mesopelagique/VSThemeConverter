//%attributes = {}

#DECLARE($folder : 4D:C1709.Folder; $deepth : Integer)->$themeFiles : Collection

$themeFiles:=New collection:C1472()
// TODO instead read Package.json to find theme files and return it

For each ($file; $folder.files(fk recursive:K87:7))
	If ($file.extension=".json")
		If (($file.name#"package") & ($file.name#"package-lock"))
			If (Position:C15("tokenColors"; $file.getText())>1)
				$themeFiles.push($file)
			End if 
		End if 
	End if 
End for each 
/*
If ($deepth>0)
For each ($subdolfer; $folder.folders())
For each ($file; FindVSThemeFiles($subdolfer; $deepth-1))  // only one level for the omment
$themeFiles.push($file)
End for each 
End for each 
End if */
