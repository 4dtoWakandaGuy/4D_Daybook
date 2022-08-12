//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_FileUpd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 00:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; $1)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_FileUpd")
//Macro_FileUpd
//domryhinh
ERR_MethodTrackerReturn("Macro_FileUpd"; $_t_oldMethodName)
