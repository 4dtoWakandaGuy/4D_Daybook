//%attributes = {}
If (False:C215)
	//Project Method Name:      DYN_RESTRUCTOR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:56
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

$_t_oldMethodName:=ERR_MethodTracker("DYN_RESTRUCTOR")
ERR_MethodTrackerReturn("DYN_RESTRUCTOR"; $_t_oldMethodName)