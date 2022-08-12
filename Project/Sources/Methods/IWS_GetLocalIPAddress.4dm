//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetLocalIPAddress
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
	//C_UNKNOWN(NTK Get Host By Name)
	//C_UNKNOWN(NTK Get Host Name)
	C_TEXT:C284($_t_oldMethodName; $0; $localhost)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetLocalIPAddress")

// (PM) IWS_GetLocalIPAddress
// Return the local IP address


$localhost:=NTK Get Host By Name(NTK Get Host Name)

$0:=$localhost
ERR_MethodTrackerReturn("IWS_GetLocalIPAddress"; $_t_oldMethodName)