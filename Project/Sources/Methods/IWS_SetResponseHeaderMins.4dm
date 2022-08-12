//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_SetResponseHeaderMins
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $iMinutes)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_SetResponseHeaderMins")
//IWS_SetResponseHeaderMins
//Set a Response Header with a calculated minutes timeout

If (Count parameters:C259>0)
	$iMinutes:=$1
	Case of 
		: (<>Web_t_ServerHandler="ITK")
			//IWS_SetResponseHeader (200;ITK_Secs2RFC (ITK_Date2Secs (Current date;Current time;1)+($iMinutes*60);1)))ITK OUT AUgust 2009
		: (<>Web_t_ServerHandler="NTK")
			IWS_SetResponseHeader(200; DATE_DateTimeToRFCString(Current date:C33; Current time:C178+$iMinutes*60))
		Else 
			
	End case 
End if 
ERR_MethodTrackerReturn("IWS_SetResponseHeaderMins"; $_t_oldMethodName)