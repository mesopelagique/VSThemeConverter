Class constructor($jsonText : Text)
	
	$jsonText:=Replace string:C233($jsonText; "\n"; "")  // one line
	$jsonText:=Replace string:C233($jsonText; "\r"; "")  // one line
	$jsonText:=Replace string:C233($jsonText; "'"; "\\'")
	
	This:C1470.js:="var jsonString='"+$jsonText+"';"
	This:C1470.js:=This:C1470.js+"var jsonObj;eval('jsonObj='+jsonString);"
	This:C1470.js:=This:C1470.js+"JSON.stringify(jsonObj);"
	
	This:C1470.url:=File:C1566("/RESOURCES/index.html")
	This:C1470.area:="removeComma"
	
Function run()->$result : Text
	$area:=WA Run offscreen area:C1727(This:C1470)
	$result:=This:C1470.result
	
Function onEvent
	Case of 
		: (FORM Event:C1606.code=On End URL Loading:K2:47)
			This:C1470.result:=WA Evaluate JavaScript:C1029(*; This:C1470.area; This:C1470.js)
	End case 