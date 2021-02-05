//%attributes = {}

var $theme : cs:C1710.Theme
$theme:=DefaultTheme()

var $emptyFontStyle : cs:C1710.FontStyle
$emptyFontStyle:=cs:C1710.FontStyle.new()

var $themeNewObject : Object
$themeNewObject:=$theme.toObject()
//ASSERT(New collection($themeObject).equal(New collection($themeNewObject)))

$str:=Select document:C905(""; ""; ""; 0)
If (OK=1)
	$file:=File:C1566(document; fk platform path:K87:2)
	$pp:=$file.path
End if 