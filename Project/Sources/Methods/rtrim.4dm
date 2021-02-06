//%attributes = {}
#DECLARE($text : Text)->$result : Text

$result:=$text
// XXX will failed if only space!!
If (Length:C16($result)>0)
	While ($result[[1]]=" ")
		$result:=Substring:C12($result; 2)
	End while 
End if 