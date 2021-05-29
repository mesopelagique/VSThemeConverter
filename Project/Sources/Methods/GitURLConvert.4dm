//%attributes = {}
#DECLARE($url : Text; $dst : 4D:C1709.Folder)->$themes : Collection
$themes:=New collection:C1472()

var $tmp : 4D:C1709.Folder
$tmp:=Folder:C1567(Temporary folder:C486; fk platform path:K87:2).folder(Generate UUID:C1066)
$tmp.create()

var $cmd; $in; $out; $err : Text
$cmd:="git"
If (Is Windows:C1573)
	$cmd:=$cmd+".exe"
End if 
$cmd:=$cmd+" clone "+$url+" '"+$tmp.path+"'"

LAUNCH EXTERNAL PROCESS:C811($cmd; $in; $out; $err)

var $themeConverted; $theme : Object
For each ($theme; FindVSThemeFiles($tmp; 1))
	
	$themeConverted:=Convert($theme; $dst)
	If ($themeConverted#Null:C1517)
		$themes.push($themeConverted)
	End if 
	
End for each 

$tmp.delete(Delete with contents:K24:24)