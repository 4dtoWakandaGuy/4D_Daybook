//%attributes = {}
If (False:C215)
	//Project Method Name:      Clear_Sxs
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
	C_LONGINT:C283(xCancel; xOK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Clear_Sxs")
xOK:=0
xCancel:=0
ERR_MethodTrackerReturn("Clear_Sxs"; $_t_oldMethodName)