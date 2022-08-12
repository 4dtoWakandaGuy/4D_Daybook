//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Disable In
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
	C_LONGINT:C283(vAdd; xDelete)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Disable In")
//Disable in
Case of 
	: (vAdd=1)
		OBJECT SET ENABLED:C1123(xDelete; False:C215)
		//_O_DISABLE BUTTON(xDelete)
End case 
ERR_MethodTrackerReturn("Disable In"; $_t_oldMethodName)
