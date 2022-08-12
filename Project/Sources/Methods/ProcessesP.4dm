//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessesP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>EXECUTE; $_t_oldMethodName; $Ex)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessesP")
Menu_Record("ProcessesP"; "Processes")

Processes
ERR_MethodTrackerReturn("ProcessesP"; $_t_oldMethodName)