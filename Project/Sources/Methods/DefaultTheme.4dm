//%attributes = {}
#DECLARE()->$theme : cs:C1710.Theme
var $resources : 4D:C1709.Folder
$resources:=Folder:C1567(Application file:C491; fk platform path:K87:2)
If (Is macOS:C1572)
	$resources:=$resources.folder("Contents")
End if 
$resources:=$resources.folder("Resources")

var $themeFile : 4D:C1709.File


If (String:C10(This:C1470.type)="dark")
	$themeFile:=$resources.folder("EditorTheme").file("defaultTheme.json")
Else 
	$themeFile:=$resources.folder("EditorTheme").file("defaultDarkTheme.json")
End if 
var $themeText : Text
$themeText:=$themeFile.getText()

var $themeObject : Object
$themeObject:=JSON Parse:C1218($themeFile.getText())

$current:=GetCurrentThemeFile
If ($current.exists)
	$current:=JSON Parse:C1218($current.getText())
	$themeObject.fontName:=$current.fontName
	$themeObject.fontSize:=Num:C11($current.fontSize)
	If ($themeObject.fontSize=0)
		$themeObject.fontSize:=12
	End if 
End if 

$theme:=cs:C1710.Theme.new($themeObject)

If (String:C10(This:C1470.type)="dark")
	$theme["__inheritedFrom__"]:="defaultDarkTheme"
Else 
	// $theme["__inheritedFrom__"]:="defaultTheme"
End if 

