//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetPageOld
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetPageOld")

//method commented out 17/03/08
ERR_MethodTrackerReturn("IWS_GetPageOld"; $_t_oldMethodName)