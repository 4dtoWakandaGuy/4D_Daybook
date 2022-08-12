//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PPSingleUS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Gen_PPSingleUS")
If (Count parameters:C259=1)
	USE NAMED SELECTION:C332($1)
	CLEAR NAMED SELECTION:C333($1)
Else 
	USE NAMED SELECTION:C332("Selection")
	CLEAR NAMED SELECTION:C333("Selection")
End if 
ERR_MethodTrackerReturn("Gen_PPSingleUS"; $_t_oldMethodName)