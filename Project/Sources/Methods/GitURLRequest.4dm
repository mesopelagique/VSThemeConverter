//%attributes = {}


$copyInComponent:=Not:C34(Shift down:C543)

$url:=Request:C163("Provide git URL of theme")

If (Length:C16($url)>0)
	var $tmp : 4D:C1709.Folder
	$tmp:=Folder:C1567(Temporary folder:C486; fk platform path:K87:2).folder(Generate UUID:C1066)
	$tmp.create()
	
	var $cmd; $in; $out; $err : Text
	$cmd:="git"
	If (Is Windows:C1573)
		$cmd:=$cmd+".exe"
	End if 
	$cmd:=$cmd+" clone "+$url+" '"+$tmp.path+"'"
	
	LAUNCH EXTERNAL PROCESS:C811($cmd; $in; $out; $err)
	
	$dst:=Folder:C1567(fk editor theme folder:K87:23)
	
	For each ($theme; FindJSONTheme($tmp; True:C214))
		
		If ($copyInComponent)
			
			$theme.copyTo(Folder:C1567(fk resources folder:K87:11).folder("vs"))
			
		End if 
		
		Convert($theme; $dst)
		
	End for each 
	
	$tmp.delete(Delete with contents:K24:24)
	
	SHOW ON DISK:C922($dst.platformPath)
	
End if 