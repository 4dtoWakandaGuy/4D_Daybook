//%attributes = {}
If (False:C215)
	//Project Method Name:      InternetConnectionStatusCheck
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
	C_LONGINT:C283($_l_Error; $_l_TCPID)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InternetConnectionStatusCheck")
// internetconnectionStatuscheck
// 31/07/02 pb
// Checks to see if there is a live internet connection
// on this machine if s-user, or on server if m-user

$_l_Error:=TCP_Open("www.daybook.co.uk"; 0; $_l_TCPID)
If (Count parameters:C259>=1)
	$1->:=$_l_Error
End if 
ERR_MethodTrackerReturn("InternetConnectionStatusCheck"; $_t_oldMethodName)