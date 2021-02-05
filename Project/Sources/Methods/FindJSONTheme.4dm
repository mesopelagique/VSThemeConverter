//%attributes = {}

#DECLARE($folder : 4D:C1709.Folder)->$themeFiles : Collection

$themeFiles:=New collection:C1472()
// TODO instead read Package.json to find theme files and return it

For each ($file; $folder.files()) Until ($themeFile#Null:C1517)
	If ($file.extension=".json")
		If ($file.name#"package")
			$themeFiles.push($file)
		End if 
	End if 
End for each 


