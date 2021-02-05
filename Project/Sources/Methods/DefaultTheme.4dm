//%attributes = {}
#DECLARE()->$theme : cs:C1710.Theme
var $resources : 4D:C1709.Folder
$resources:=Folder:C1567(Application file:C491; fk platform path:K87:2)
If (Is macOS:C1572)
	$resources:=$resources.folder("Contents")
End if 
$resources:=$resources.folder("Resources")

var $themeFile : 4D:C1709.File
$themeFile:=$resources.folder("EditorTheme").file("defaultTheme.json")

var $themeText : Text
$themeText:=$themeFile.getText()

var $themeObject : Object
$themeObject:=JSON Parse:C1218($themeFile.getText())

$theme:=cs:C1710.Theme.new($themeObject)