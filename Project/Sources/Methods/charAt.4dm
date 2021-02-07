//%attributes = {}
#DECLARE($text : Text; $at : Integer)->$char : Text

Case of 
	: (0=$at)
		$char:=""
	: (Length:C16($text)>=$at)
		$char:=$text[[$at]]
	Else 
		$char:=""
End case 

