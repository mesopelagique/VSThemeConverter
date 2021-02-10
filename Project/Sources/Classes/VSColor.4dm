Class extends VSObject


Class constructor($color : Text)
	This:C1470.color:=$color
	
Function toFontStyle()->$style : cs:C1710.FontStyle
	$style:=cs:C1710.FontStyle.new()
	
Function getColor()->$color : Text
	$color:=String:C10(This:C1470.color)
	$color:=This:C1470.normalizeColor($color)
	
	
Function toStyle()->$style : cs:C1710.Style
	
	$style:=cs:C1710.Style.new()  // no sub level
	$style.color:=This:C1470.getColor()
	$style.style:=This:C1470.toFontStyle()
	
Function toColor()->$style : cs:C1710.Style
	$style:=cs:C1710.Style.new()  // no sub level
	$style.color:=This:C1470.getColor()
	