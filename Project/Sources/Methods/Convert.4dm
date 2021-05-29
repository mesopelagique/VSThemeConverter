//%attributes = {}
#DECLARE($themeFile : 4D:C1709.File; $dst : 4D:C1709.Folder)->$dstFile : 4D:C1709.File

If (Not:C34($dst.exists))
	$dst.create()
End if 

var $themeText : Text
$themeText:=$themeFile.getText()

$themeText:=Replace string:C233($themeText; Char:C90(9); "")
// remove comments
$lines:=Split string:C1554($themeText; "\r")
$themeText:=""

For each ($line; $lines)
	$ok:=(Position:C15("//"; rtrim($line))#1)  // no start comment
	If ($ok)
		
		$pos:=Position:C15("//"; $line)
		If ($pos=0)
			$themeText:=$themeText+$line+"\r"
			
		Else 
			
			If (Position:C15("\","; $line)>$pos)
				$themeText:=$themeText+$line+"\r"
			Else 
				$themeText:=$themeText+Substring:C12($line; 0; $pos-1)+"\r"
				
			End if 
		End if 
		
	End if 
End for each 

// remove trailing
$themeText:=cs:C1710.JSONFix.new($themeText).run()

$onErr:=Method called on error:C704
ON ERR CALL:C155("void")
var $themeObject : Object
$themeObject:=JSON Parse:C1218($themeText)
ON ERR CALL:C155($onErr)

If ($themeObject#Null:C1517)
	var $theme : cs:C1710.VSTheme
	$theme:=cs:C1710.VSTheme.new($themeObject)
	
	
	var $dstTheme : cs:C1710.Theme
	$dstTheme:=$theme.to4DTheme()
	
	If ($themeFile.fullName="defaultTheme.json")
		$parent:=$themeFile.parent
		While ($parent#Null:C1517)
			$lastparent:=$parent
			$parent:=$parent.parent
		End while 
		$dstFile:=$dst.file($lastparent.fullName+".json")
	Else 
		$dstFile:=$dst.file($themeFile.fullName)
	End if 
	
	$dstFile.setText(JSON Stringify:C1217($dstTheme.toObject(); *))
Else 
	ALERT:C41("Failed "+$themeFile.fullName)
End if 