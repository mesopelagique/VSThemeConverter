


Class constructor($object : Object)
	
	This:C1470.name:=$object.name
	This:C1470.type:=$object.type
	This:C1470.semanticHighlighting:=Bool:C1537($object.semanticHighlighting)
	
	This:C1470.colors:=$object.colors  // editor colors
	
	
	This:C1470.tokenColors:=New collection:C1472()
	
	For each ($tokenColor; $object.tokenColors)
		
		This:C1470.tokenColors.push(cs:C1710.VSTokenColor.new($tokenColor))
		
	End for each 
	
Function colorTokenForScope($scopes : Text)->$token : Object
	
	For each ($scope; Split string:C1554($scopes; " ")) Until ($token#Null:C1517)
		$col:=This:C1470.tokenColors.filter("findInSubCol"; "scope"; $scope)
		If ($col.length>0)
			$token:=$col[0]
		End if 
	End for each 
	
	
	If ($token=Null:C1517)
		$token:=cs:C1710.Empty.new()
	End if 
	
Function colorForScope($scopes : Text)->$token : Object
	
	For each ($scope; Split string:C1554($scopes; " ")) Until ($token#Null:C1517)
		If (This:C1470.colors[$scope]#Null:C1517)
			$token:=cs:C1710.VSColor.new(This:C1470.colors[$scope])
		End if 
	End for each 
	
	If ($token=Null:C1517)
		$token:=This:C1470.colorTokenForScope($scopes)
	End if 
	
	If ($token=Null:C1517)
		$token:=cs:C1710.Empty.new()
	End if 
	
Function apply($theme; $cat; $key; $vskey)
	If ($cat="otherStyles")
		$style:=This:C1470.colorForScope($vskey).toColor()
	Else 
		$style:=This:C1470.colorForScope($vskey).toStyle()
	End if 
	
	If ($style#Null:C1517)
		If (Length:C16($style.color)#0)
			$theme[$cat][$key]:=$style
		End if 
	End if 
	
Function to4DTheme()->$theme : cs:C1710.Theme
	$theme:=DefaultTheme(String:C10(This:C1470.type))
	$mapping:=JSON Parse:C1218(Folder:C1567(fk resources folder:K87:11).file("mapping.json").getText())
	For each ($cat; $mapping)
		For each ($key; $mapping[$cat])
			This:C1470.apply($theme; $cat; $key; $mapping[$cat][$key])
		End for each 
	End for each 
/*
$theme["4D"].comments:=This.colorTokenForScope("comment").toStyle()
$theme["4D"].commands:=This.colorTokenForScope("support.function constant.numeric.decimal.js markup.bold").toStyle()
$theme["4D"].constants:=This.colorTokenForScope("constant.language constant").toStyle()
$theme["4D"].entity_member:=This.colorTokenForScope("variable.property storage.type entity.name.section").toStyle()
$theme["4D"].errors:=This.colorForScope("invalid editorError.foreground markup.heading").toStyle()
$theme["4D"].fields:=This.colorTokenForScope("entity.name.tag").toStyle()
$theme["4D"]["indexed-fields"]:=This.colorTokenForScope("string.template").toStyle()
$theme["4D"]["interprocess_variables"]:=This.colorTokenForScope("variable.language").toStyle()
	
$theme["4D"].local_variables:=This.colorTokenForScope("variable").toStyle()
$theme["4D"].memberFunc:=This.colorTokenForScope("support.function entity.name.function variable.function").toStyle()
$theme["4D"].methods:=This.colorTokenForScope("meta.method variable.function support.function").toStyle()
$theme["4D"].parameters:=This.colorTokenForScope("Variable").toStyle()
$theme["4D"].plain_text:=This.colorForScope("foreground editor.foreground").toStyle()
$theme["4D"].plug_ins:=This.colorTokenForScope("entity.name.tag").toStyle()
$theme["4D"].process_variables:=This.colorForScope("foreground").toStyle()
$theme["4D"].tables:=This.colorTokenForScope("entity.other.attribute-name").toStyle()
$theme["4D"]["thread-safe-commands"]:=This.colorTokenForScope("comment").toStyle()
$theme["4D"]["thread-safe-methods"]:=This.colorTokenForScope("comment").toStyle()
	
	
If (False)
$theme["4D"].keywords:=This.colorTokenForScope("keyword.other.unit").toStyle()
$theme["4D"].member:=This.colorTokenForScope("keyword").toStyle()
Else 
$theme["4D"].keywords:=This.colorTokenForScope("keyword").toStyle()
$theme["4D"].member:=This.colorTokenForScope("keyword.other.unit").toStyle()
End if 
	
$theme["JSON"].commands:=This.colorTokenForScope("variable").toStyle()
$theme["JSON"].escapeSequences:=This.colorForScope("editorError.foreground markup.heading").toStyle()
$theme["JSON"].identifiers:=This.colorForScope("editorError.foreground markup.heading").toStyle()
$theme["JSON"].errors:=This.colorForScope("invalid editorError.foreground markup.heading").toStyle()
$theme["JSON"].keywords:=This.colorTokenForScope("keyword").toStyle()
$theme["JSON"].numbers:=This.colorTokenForScope("constant.numeric").toStyle()
$theme["JSON"].normal:=This.colorTokenForScope("foreground").toStyle()
$theme["JSON"].strings:=This.colorTokenForScope("string.quoted").toStyle()
	
	
$theme["SQL"].commands:=This.colorTokenForScope("variable").toStyle()
$theme["SQL"].comparisons:=This.colorTokenForScope("comment").toStyle()
$theme["SQL"].debug:=This.colorTokenForScope("comment").toStyle()
$theme["SQL"].function_keywords:=This.colorTokenForScope("support.function variable.function").toStyle()
$theme["SQL"].keywords:=This.colorTokenForScope("keyword").toStyle()
$theme["SQL"].names:=This.colorTokenForScope("variable").toStyle()
$theme["SQL"].normal:=This.colorTokenForScope("foreground").toStyle()
$theme["SQL"].numbers:=This.colorTokenForScope("constant.numeric").toStyle()
$theme["SQL"].strings:=This.colorTokenForScope("string.quoted").toStyle()
	
	
$theme["otherStyles"].commands:=This.colorTokenForScope("comment").toColor()
$theme["otherStyles"].back_color:=This.colorForScope("editor.background").toColor()
$theme["otherStyles"].cursor_line_back_color:=This.colorTokenForScope("foreground").toColor()
$theme["otherStyles"].cursor_line_color:=This.colorTokenForScope("editorCursor.foreground foreground").toColor()
$theme["otherStyles"].execution_line_back_color:=This.colorTokenForScope("comment").toColor()
$theme["otherStyles"].execution_line_frame_color:=This.colorTokenForScope("comment").toColor()
$theme["otherStyles"].hilite_back_color:=This.colorForScope("selection.background editor.selectionBackground").toColor()
$theme["otherStyles"].hilite_block_back_color:=This.colorTokenForScope("editor.selectionHighlightBackground").toColor()
$theme["otherStyles"].matching_parenthesis_back_color:=This.colorTokenForScope("comment").toColor()
$theme["otherStyles"].same_word_back_color:=This.colorTokenForScope("comment").toColor()
$theme["otherStyles"].suggestion_color:=This.colorTokenForScope("comment").toColor()*/