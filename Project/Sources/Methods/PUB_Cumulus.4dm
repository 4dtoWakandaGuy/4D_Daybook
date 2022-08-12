//%attributes = {}
If (False:C215)
	//Project Method Name:      PUB_Cumulus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   31/07/2010 17:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRIght; $_l_WindowTop; $2; $3; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_CurrentWinRefOLD; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRIght; $_l_WindowTop; $2; $3; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $1; $4; COM_T_DataString; $_t_BuiltSearch; $_t_oldMethodName; $4; COM_T_DataString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUB_Cumulus")


If (True:C214)
	If (Count parameters:C259>3)
		$_t_BuiltSearch:=$4
		$_t_BuiltSearch:=CO_NewsApplyTokens($_t_BuiltSearch)
		COM_T_DataString:=$_t_BuiltSearch
	Else 
		
		COM_T_DataString:="http://digitalmedia.creamermedia.co.za:8080/Cumulus"
	End if 
	If (COM_T_DataString#"")
		//COM_T_DataString:="www.google.com"
		$_l_WindowBottom:=Screen height:C188-40
		If (Count parameters:C259>=3)
			$_l_WindowTop:=$3
		Else 
			$_l_WindowTop:=40
		End if 
		
		If ($_l_WindowBottom<$_l_WindowTop)
			$_l_WindowBottom:=Screen height:C188-5
			$_l_WindowTop:=$_l_WindowBottom-400
		Else 
			If ($_l_WindowBottom>($_l_WindowTop+400))
				$_l_WindowBottom:=Screen height:C188-5
			End if 
		End if 
		$_l_WindowRIght:=Screen width:C187-20
		If (Count parameters:C259>=2)
			$_l_WindowLeft:=$2
		Else 
			$_l_WindowLeft:=60
		End if 
		If ($_l_WindowRIght<$_l_WindowLeft)
			$_l_WindowRIght:=Screen width:C187
			$_l_WindowLeft:=Screen width:C187-400
		Else 
			If ($_l_WindowRIght>($_l_WindowLeft+400))
				$_l_WindowRIght:=Screen width:C187-100
			End if 
		End if 
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom; 4096; "Search Results"; "CO_CloseNews")
		//FORM SET INPUT([DIARY]; "CUMULUS")
		
		ADD RECORD:C56([DIARY:12])
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
Else 
	//
	//ARRAY TEXT($_l_Options;3)
	//$_l_Options{1}:="-Xms128M"
	//$_l_Options{2}:="-Xmx128M"
	//$_l_Options{3}:="-Djworld.stdout.redirect=true"
	//
	//`$Err:=JWD Set JVM options ($Options)
	//If ($Err=0)
	//$JVM_ID:=JWD Create java world ("BUILT-IN")
	//If ($JVM_ID>0)
	//$Err:=JEX Set environment ($JVM_ID;"TRIAL")
	//If ($Err#0)
	ALERT:C41("Error:JEX Set environment")
	//Else 
	//``
	//WsUserConnectionData  `
	//End if 
	
	//Else 
	//ALERT("Error:JWD Create java world")
	//End if 
End if 
ERR_MethodTrackerReturn("PUB_Cumulus"; $_t_oldMethodName)
