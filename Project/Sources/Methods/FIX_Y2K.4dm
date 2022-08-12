//%attributes = {}
If (False:C215)
	//Project Method Name:      FIX_Y2K
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 12:25:49If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("FIX_Y2K")
ERR_MethodTrackerReturn("FIX_Y2K"; $_t_oldMethodName)