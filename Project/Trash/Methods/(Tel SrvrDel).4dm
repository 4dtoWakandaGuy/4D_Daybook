//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel SrvrDel
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel SrvrDel")
//Tel SrvrDel - delete a file on the server
PLUGCALL_Telephony("Session"; 1)
ERR_MethodTrackerReturn("Tel SrvrDel"; $_t_oldMethodName)
