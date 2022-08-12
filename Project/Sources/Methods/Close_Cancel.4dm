//%attributes = {}
If (False:C215)
	//Project Method Name:      Close_Cancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(xCancel)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Close_Cancel")
xCancel:=1
CANCEL:C270
ERR_MethodTrackerReturn("Close_Cancel"; $_t_oldMethodName)