//%attributes = {}
var $url : Text
$url:=Request:C163("Provide git URL of theme")

If (Length:C16($url)>0)
	
	var $dst : 4D:C1709.Folder
	$dst:=Folder:C1567(fk editor theme folder:K87:23)
	
	var $themes : Collection
	$themes:=GitURLConvert($url; $dst)
	
	// XXX alternatively we could show one of $themes
	If ($themes.length>0)
		SHOW ON DISK:C922($themes[0].platformPath)
	Else 
		SHOW ON DISK:C922($dst.platformPath)
	End if 
End if 

$0:=$dst