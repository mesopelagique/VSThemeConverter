//%attributes = {}


#DECLARE($color : Text)->$lumi : Integer

$color:=normalizeColor($color)

$color:=Substring:C12($color; 2)

$red:=hexToInt(Substring:C12($color; 1; 2))
$green:=hexToInt(Substring:C12($color; 3; 2))
$blue:=hexToInt(Substring:C12($color; 5; 2))

$lumi:=(0.2126*$red)+(0.7152*$green)+(0.0722*$blue)

