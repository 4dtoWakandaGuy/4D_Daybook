
If (False:C215)
	//Object Name:      EW_ExportProjectsManager.Invisible Button4
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($_ptr_PalletButton)
	C_TEXT:C284($_t_oldMethodName; PAL_BUTTON)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ EW_ExportProjectsManager.Invisible Button4"; Form event code:C388)

$_t_oldMethodName:=ERR_MethodTracker("OBJ EW_ExportProjectsManager.Invisible Button4"; Form event code:C388)

$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
ERR_MethodTrackerReturn("OBJ EW_ExportProjectsManager.Invisible Button4"; $_t_oldMethodName)