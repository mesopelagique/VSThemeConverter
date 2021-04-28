Class extends VSObject

Class constructor($object : Object)
	
	This:C1470.name:=$object.name
	This:C1470.scope:=$object.scope
	This:C1470.settings:=$object.settings
	
/*
    {
      "name": "Comment",
      "scope": [
        "comment", 
        "string.quoted.docstring.multi.python", 
        "string.quoted.docstring.multi.python punctuation.definition.string.begin.python",
        "string.quoted.docstring.multi.python punctuation.definition.string.end.python"
      ],
      "settings": {
        "foreground": "#848bbd",
        "fontStyle": "italic"
      }
    }
*/
	
	// convert to 4d font style
Function toFontStyle()->$style : cs:C1710.FontStyle
	$style:=cs:C1710.FontStyle.new()
	var $fontStyle : Text
	$fontStyle:=String:C10(This:C1470.settings.fontStyle)  // XXX check if only string or could be a collection
	
	$style.bold:=Position:C15("bold"; $fontStyle)>0
	$style.italic:=Position:C15("italic"; $fontStyle)>0
	$style.underline:=Position:C15("underline"; $fontStyle)>0
	
	
Function getColor()->$color : Text
	$color:=String:C10(This:C1470.settings.foreground)
	$color:=normalizeColor($color)
	
	
Function toStyle()->$style : cs:C1710.Style
	
	$style:=cs:C1710.Style.new()  // no sub level
	$style.color:=This:C1470.getColor()
	$style.style:=This:C1470.toFontStyle()
	
	
Function toColor()->$style : cs:C1710.Style
	$style:=cs:C1710.Style.new()  // no sub level
	$style.color:=This:C1470.getColor()