//%attributes = {}
#DECLARE($text : Text)->$result : Text

$result:=$text
$l:=Length:C16($result)
If ($l>0)
	$pos:=1
	While (($l>=$pos) & (charAt($result; $pos)=" ")))
		$pos:=$pos+1
	End while 
	If ($pos>1)
		$result:=Substring:C12($result; $pos)
	End if 
End if 