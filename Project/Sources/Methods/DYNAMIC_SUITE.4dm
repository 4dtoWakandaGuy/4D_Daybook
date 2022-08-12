//%attributes = {}
If (False:C215)
	//Project Method Name:      DYNAMIC_SUITE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:23:03If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("DYNAMIC_SUITE")
ERR_MethodTrackerReturn("DYNAMIC_SUITE"; $_t_oldMethodName)