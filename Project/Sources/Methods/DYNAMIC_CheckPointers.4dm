//%attributes = {}
If (False:C215)
	//Project Method Name:      DYNAMIC_CheckPointers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:22:23If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("DYNAMIC_CheckPointers")
ERR_MethodTrackerReturn("DYNAMIC_CheckPointers"; $_t_oldMethodName)