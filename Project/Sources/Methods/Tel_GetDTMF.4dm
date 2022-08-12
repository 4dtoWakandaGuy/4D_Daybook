//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_GetDTMF
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
	C_LONGINT:C283($1; $2; VTELTASK)
	C_TEXT:C284($_t_oldMethodName; $0; $3; $d)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_GetDTMF")
//Tel_GetDTMF - ie get digits
//& "@" means all (ie immediate terminate) "23456789#*ABCD" means all but 1
//If $3 = "", no digits terminate (so make sure you timeout)
//$0 returns the digits typed within the timeout

PLUGCALL_Telephony("GetDTMF"; 1)

//$0:=$d
ERR_MethodTrackerReturn("Tel_GetDTMF"; $_t_oldMethodName)
