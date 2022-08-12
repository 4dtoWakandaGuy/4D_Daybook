//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_CurrentTimeRFC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $_l_offset; $Secs)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_CurrentTimeRFC")
//Returns current date and Time_In RFC form,
//e.g., Wed, 04 Jun 1998 22:34:07 GMT

If (Count parameters:C259=1)
	$_l_offset:=$1
End if 

$0:=DATE_DateTimeToRFCString(Current date:C33; Current time:C178+$_l_offset)
ERR_MethodTrackerReturn("IWS_CurrentTimeRFC"; $_t_oldMethodName)