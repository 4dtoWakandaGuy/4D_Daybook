//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Alert
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//C_UNKNOWN($3)
	//C_UNKNOWN(t_DB_ErrorAlertMethodInfo)
	//C_UNKNOWN(vConfirm)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; $_bo_DisplayOnScreen; $_bo_Macintosh; $_bo_onServer; DB_bo_AlertReply; DB_bo_AlertTimeOut; IME_bo_FromWebRequest; SYS_bo_NoTrack; <>SCPT_bo_NoAutoScripts; <>SYS_bo_CurrentWindowModal; $_bo_DisplayOnScreen)
	C_BOOLEAN:C305($_bo_onServer; DB_bo_AlertTimeOut; IME_bo_FromWebRequest)
	C_LONGINT:C283($_l_CentreVertical; $_l_CurrentWinRefOLD; $_l_WindowReference; $3; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_CentreHorizontal; $_l_CentreVertical; $_l_CurrentWinRefOLD; $_l_WindowReference; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_crlf; $_t_oldMethodName; $1; $2; t_DB_ErrorAlertMethodInfo; vConfirm; <>ButtOK; $_t_crlf; $_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Alert")

SHOW PROCESS:C325(Current process:C322)
BRING TO FRONT:C326(Current process:C322)


IME_WebMessagesInit



If (IME_bo_FromWebRequest=False:C215)
	
	
	
	If (Is macOS:C1572)
		$_t_crlf:=Char:C90(13)
	Else 
		$_t_crlf:=Char:C90(13)+Char:C90(10)
	End if 
	$_bo_onServer:=False:C215
	Case of 
		: (Current process:C322<0)  //it's in a stored proc
			$_bo_onServer:=True:C214
		: (Application type:C494=4D Server:K5:6)
			$_bo_onServer:=True:C214
			
		Else   // client or s-user
			// OK
	End case 
	$_bo_DisplayOnScreen:=True:C214
	If ($_bo_onServer=True:C214)
		$_bo_DisplayOnScreen:=False:C215  //Will display on screen if error is inidctaed when we log to file.
		If (t_DB_ErrorAlertMethodInfo="")
			$_bo_DisplayOnScreen:=LOG_text($1; "DaybookAlerts.txt")
		Else 
			$_bo_DisplayOnScreen:=LOG_text((t_DB_ErrorAlertMethodInfo+Char:C90(9)+$1); "Alerts.txt")
		End if 
	End if 
	
	// If (Count parameters=1)  ` simple Alert 21/03/03 pb
	//  ALERT($1)
	If ($_bo_DisplayOnScreen)
		//  Else
		<>SYS_bo_CurrentWindowModal:=True:C214
		vConfirm:=$1
		$_l_CentreHorizontal:=Screen height:C188/2
		$_l_CentreVertical:=Screen width:C187/2
		If (Count parameters:C259<3)
			$_l_WindowReference:=Open window:C153($_l_CentreVertical; $_l_CentreHorizontal; $_l_CentreVertical; $_l_CentreHorizontal)
		Else 
			$_l_WindowReference:=Open window:C153($_l_CentreVertical; 110; $_l_CentreVertical; 110; $3)
		End if 
		
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=$_l_WindowReference
		If (Count parameters:C259>1)
			If ($2#"")
				<>ButtOK:=$2
			Else 
				<>ButtOK:=""
			End if 
			
		Else 
			<>ButtOK:=""
		End if 
		DIALOG:C40([COMPANIES:2]; "dAlert")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		<>SYS_bo_CurrentWindowModal:=False:C215
		DB_bo_AlertTimeOut:=False:C215  //Note this is reset here
		
	End if 
	//End if
	
Else 
	
	IME_WebMessagesAddWarning("Alert Message Warning"; "Warning. From the web, the system couldn't display to the user the following mess"+"age... '"+$1+" '.")
	OK:=1
	
End if 
ERR_MethodTrackerReturn("Gen_Alert"; $_t_oldMethodName)
