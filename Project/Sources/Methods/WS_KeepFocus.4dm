//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_KeepFocus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2010 18:33
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

$_t_oldMethodName:=ERR_MethodTracker("WS_KEEPFOCUS")
//29/10/2009

//
If (Not:C34(Frontmost process:C327=Current process:C322))
	//BRING TO FRONT(1)
	BRING TO FRONT:C326(Current process:C322)
End if 
//ERR_MethodTrackerReturn ("WS_KEEPFOCUS";$_t_oldMethodName)