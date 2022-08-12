//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_GetStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/06/2010 15:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_GetStatus")
ERR_MethodTrackerReturn("PO_GetStatus"; $_t_oldMethodName)