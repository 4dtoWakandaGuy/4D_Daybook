//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_GetSubfieldData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 14:42:27If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_GetSubfieldData")
ERR_MethodTrackerReturn("EW_GetSubfieldData"; $_t_oldMethodName)