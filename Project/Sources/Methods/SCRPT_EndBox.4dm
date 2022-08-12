//%attributes = {}
If (False:C215)
	//Project Method Name:      SCRPT_EndBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2012 11:35
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

$_t_oldMethodName:=ERR_MethodTracker("SCRPT_EndBox")
CANCEL:C270
ERR_MethodTrackerReturn("SCRPT_EndBox"; $_t_oldMethodName)