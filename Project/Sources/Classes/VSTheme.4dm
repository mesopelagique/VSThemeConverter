


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
	
Function to4DTheme()->$theme : cs:C1710.Theme
	
	$theme:=DefaultTheme(String:C10(This:C1470.type))
	
	
	$theme["4D"].comments:=This:C1470.colorTokenForScope("comment").toStyle()
	
	
	$theme["4D"].commands:=This:C1470.colorTokenForScope("support.function constant.numeric.decimal.js markup.bold").toStyle()
	$theme["4D"].constants:=This:C1470.colorTokenForScope("constant.language constant").toStyle()
	$theme["4D"].entity_member:=This:C1470.colorTokenForScope("variable.property storage.type entity.name.section").toStyle()
	$theme["4D"].errors:=This:C1470.colorForScope("editorError.foreground markup.heading").toStyle()
	$theme["4D"].fields:=This:C1470.colorTokenForScope("entity.name.tag").toStyle()
	$theme["4D"]["indexed-fields"]:=This:C1470.colorTokenForScope("string.template").toStyle()
	$theme["4D"]["interprocess_variables"]:=This:C1470.colorTokenForScope("variable.language").toStyle()
	
	$theme["4D"].local_variables:=This:C1470.colorTokenForScope("variable").toStyle()
	$theme["4D"].memberFunc:=This:C1470.colorTokenForScope("support.function entity.name.function variable.function").toStyle()
	$theme["4D"].methods:=This:C1470.colorTokenForScope("meta.method variable.function support.function").toStyle()
	$theme["4D"].parameters:=This:C1470.colorTokenForScope("Variable").toStyle()
	$theme["4D"].plain_text:=This:C1470.colorForScope("foreground editor.foreground").toStyle()
	$theme["4D"].plug_ins:=This:C1470.colorTokenForScope("entity.name.tag").toStyle()
	$theme["4D"].process_variables:=This:C1470.colorForScope("foreground").toStyle()
	$theme["4D"].tables:=This:C1470.colorTokenForScope("entity.other.attribute-name").toStyle()
	$theme["4D"]["thread-safe-commands"]:=This:C1470.colorTokenForScope("comment").toStyle()
	$theme["4D"]["thread-safe-methods"]:=This:C1470.colorTokenForScope("comment").toStyle()
	
	
	If (False:C215)
		$theme["4D"].keywords:=This:C1470.colorTokenForScope("keyword.other.unit").toStyle()
		$theme["4D"].member:=This:C1470.colorTokenForScope("keyword").toStyle()
	Else 
		$theme["4D"].keywords:=This:C1470.colorTokenForScope("keyword").toStyle()
		$theme["4D"].member:=This:C1470.colorTokenForScope("keyword.other.unit").toStyle()
	End if 
	
	$theme["JSON"].commands:=This:C1470.colorTokenForScope("variable").toStyle()
	$theme["JSON"].escapeSequences:=This:C1470.colorForScope("editorError.foreground markup.heading").toStyle()
	$theme["JSON"].identifiers:=This:C1470.colorForScope("editorError.foreground markup.heading").toStyle()
	$theme["JSON"].errors:=This:C1470.colorForScope("editorError.foreground markup.heading").toStyle()
	$theme["JSON"].keywords:=This:C1470.colorTokenForScope("keyword").toStyle()
	$theme["JSON"].numbers:=This:C1470.colorTokenForScope("constant.numeric").toStyle()
	$theme["JSON"].normal:=This:C1470.colorTokenForScope("foreground").toStyle()
	$theme["JSON"].strings:=This:C1470.colorTokenForScope("string.quoted").toStyle()
	
	
	$theme["SQL"].commands:=This:C1470.colorTokenForScope("variable").toStyle()
	$theme["SQL"].comparisons:=This:C1470.colorTokenForScope("comment").toStyle()
	$theme["SQL"].debug:=This:C1470.colorTokenForScope("comment").toStyle()
	$theme["SQL"].function_keywords:=This:C1470.colorTokenForScope("support.function variable.function").toStyle()
	$theme["SQL"].keywords:=This:C1470.colorTokenForScope("keyword").toStyle()
	$theme["SQL"].names:=This:C1470.colorTokenForScope("variable").toStyle()
	$theme["SQL"].normal:=This:C1470.colorTokenForScope("foreground").toStyle()
	$theme["SQL"].numbers:=This:C1470.colorTokenForScope("constant.numeric").toStyle()
	$theme["SQL"].strings:=This:C1470.colorTokenForScope("string.quoted").toStyle()
	
	
	$theme["otherStyles"].commands:=This:C1470.colorTokenForScope("comment").toColor()
	$theme["otherStyles"].back_color:=This:C1470.colorForScope("editor.background").toColor()
	$theme["otherStyles"].cursor_line_back_color:=This:C1470.colorTokenForScope("foreground").toColor()
	$theme["otherStyles"].cursor_line_color:=This:C1470.colorTokenForScope("foreground").toColor()
	$theme["otherStyles"].execution_line_back_color:=This:C1470.colorTokenForScope("comment").toColor()
	$theme["otherStyles"].execution_line_frame_color:=This:C1470.colorTokenForScope("comment").toColor()
	$theme["otherStyles"].hilite_back_color:=This:C1470.colorForScope("selection.background editor.selectionBackground").toColor()
	$theme["otherStyles"].hilite_block_back_color:=This:C1470.colorTokenForScope("editor.selectionHighlightBackground").toColor()
	$theme["otherStyles"].matching_parenthesis_back_color:=This:C1470.colorTokenForScope("comment").toColor()
	$theme["otherStyles"].same_word_back_color:=This:C1470.colorTokenForScope("comment").toColor()
	$theme["otherStyles"].suggestion_color:=This:C1470.colorTokenForScope("comment").toColor()