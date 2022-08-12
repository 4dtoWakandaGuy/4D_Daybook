//%attributes = {}
If (False:C215)
	//Project Method Name:      REP_GetCompany
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/02/2010 13:33
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

$_t_oldMethodName:=ERR_MethodTracker("REP_GetCompany")



If (Count parameters:C259>=1)
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1)
End if 
ERR_MethodTrackerReturn("REP_GetCompany"; $_t_oldMethodName)