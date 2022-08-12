//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Read_Only
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
	C_LONGINT:C283(MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Read_Only")
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146
End if 
ERR_MethodTrackerReturn("Gen_Read_Only"; $_t_oldMethodName)