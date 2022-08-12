//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_AlertAcc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Gen_AlertAcc")
Gen_Alert("You do not have access to "+$1; "Cancel")
ERR_MethodTrackerReturn("Gen_AlertAcc"; $_t_oldMethodName)