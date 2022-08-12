//%attributes = {}
If (False:C215)
	//Project Method Name:      PROC_WindowStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/04/2010 10:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WindowReference)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROC_WindowStates")
$_l_WindowReference:=Open window:C153(80; 80; 80; 400; -Palette window:K34:3)
DIALOG:C40("ProcessWindowStates")
ERR_MethodTrackerReturn("PROC_WindowStates"; $_t_oldMethodName)
