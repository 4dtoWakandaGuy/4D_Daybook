//%attributes = {}
If (False:C215)
	//Project Method Name:      onExit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2012 10:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_OnExit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("onExit")

On_Exit_Process
DB_bo_OnExit:=True:C214
DB_UnitTextConfirmation("EXITING PROGRAMME")
ERR_MethodTrackerReturn("onExit"; $_t_oldMethodName)