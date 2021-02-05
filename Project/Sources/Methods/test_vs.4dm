//%attributes = {}


var $themeFile : 4D:C1709.File
$themeFile:=Folder:C1567(fk resources folder:K87:11).file("synthwave-color-theme.json")

var $themeText : Text
$themeText:=$themeFile.getText()


$themeText:=cs:C1710.JSONFix.new($themeText).run()



var $themeObject : Object
$themeObject:=JSON Parse:C1218($themeText)

var $theme : cs:C1710.VSTheme
$theme:=cs:C1710.VSTheme.new($themeObject)

$tokens:=$theme.colorsTokenForScope("comment")

$tokens:=$theme.colorsTokenForScope("constant.numeric")
$tokens:=$theme.colorsTokenForScope("constant.language")  // bool null

$tokens:=$theme.colorsTokenForScope("entity.name")
$tokens:=$theme.colorsTokenForScope("entity.name.tag")

$tokens:=$theme.colorsTokenForScope("string.quoted")
$tokens:=$theme.colorsTokenForScope("string.template")
ASSERT:C1129($tokens.length=2)
/*"keyword","
"keyword.control", 
"keyword.operator"*/

//"variable.function"
$tokens:=$theme.colorsTokenForScope("variable")
ASSERT:C1129($tokens.length=1)
$tokens:=$theme.colorsTokenForScope("variable.language")
ASSERT:C1129($tokens.length=1)
$tokens:=$theme.colorsTokenForScope("storage.type")
ASSERT:C1129($tokens.length=1)

$style4d:=$tokens[0].toStyle()



$theme.to4DTheme()