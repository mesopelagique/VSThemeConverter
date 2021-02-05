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
	
	$fontStyle:=String:C10(This:C1470.settings.fontStyle)  // XXX check if only string or could be a collection
	
	Case of 
		: ($fontStyle="italic")
			$style.italic:=True:C214
		: ($fontStyle="bold")
			$style.bold:=True:C214
		Else 
			// othin
	End case 
	
Function getColor()->$color : Text
	$color:=String:C10(This:C1470.settings.foreground)
	
	
Function toStyle()->$style : cs:C1710.Style
	
	$style:=cs:C1710.Style.new()  // no sub level
	$style.color:=This:C1470.getColor()
	$style.style:=This:C1470.toFontStyle()
	
	
Function toColor()->$style : cs:C1710.Style
	$style:=cs:C1710.Style.new()  // no sub level
	$style.color:=This:C1470.getColor()