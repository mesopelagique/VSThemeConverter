//%attributes = {}
#DECLARE($color : Text)->$norm : Text
Case of 
	: (Length:C16($color)=0)
		$norm:=""
	: (Length:C16($color)>7)
		$norm:=Substring:C12($color; 1; 7)
	: ((Length:C16($color)=4) & ($color[[1]]="#"))
		$norm:="#"+$color[[2]]+$color[[2]]+$color[[3]]+$color[[3]]+$color[[4]]+$color[[4]]
	: ((Length:C16($color)=5) & ($color[[1]]="#"))
		$norm:="#"+$color[[2]]+$color[[2]]+$color[[3]]+$color[[3]]+$color[[4]]+$color[[5]]
	: ((Length:C16($color)=2) & ($color[[1]]="#"))
		$norm:="#"+$color[[2]]+$color[[2]]+$color[[2]]+$color[[2]]+$color[[2]]+$color[[2]]
	Else 
		$norm:=$color
End case 