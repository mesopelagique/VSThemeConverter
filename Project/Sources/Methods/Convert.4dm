//%attributes = {}
#DECLARE($themeFile : 4D:C1709.File; $dst : 4D:C1709.Folder)


If (Not:C34($dst.exists))
	$dst.create()
End if 

var $themeText : Text
$themeText:=$themeFile.getText()

$themeText:=cs:C1710.JSONFix.new($themeText).run()


var $themeObject : Object
$themeObject:=JSON Parse:C1218($themeText)

var $theme : cs:C1710.VSTheme
$theme:=cs:C1710.VSTheme.new($themeObject)


var $dstTheme : cs:C1710.Theme
$dstTheme:=$theme.to4DTheme()

var $dstFile : 4D:C1709.File
$dstFile:=$dst.file($themeFile.fullName)

$dstFile.setText(JSON Stringify:C1217($dstTheme.toObject(); *))