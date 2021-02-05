//%attributes = {}
#DECLARE($entry : Object; $key : Text; $value : Variant)

/*var $1; $entry : Object
$entry:=$1
var $2; $key : Text
$key:=$2
var $3; $value : Variant
$value:=$3*/

Case of 
	: ($entry.value[$key]=Null:C1517)
		$entry.result:=False:C215
	: (Value type:C1509($entry.value[$key])=Is collection:K8:32)
		$entry.result:=$entry.value[$key].indexOf($value)#-1
	: (Value type:C1509($entry.value[$key])=Is text:K8:3)
		$entry.result:=((Split string:C1554($entry.value[$key]; " ").indexOf($value)#-1) | \
			(Split string:C1554($entry.value[$key]; ",").indexOf($value)#-1))
	Else 
		$entry.result:=False:C215
End case 