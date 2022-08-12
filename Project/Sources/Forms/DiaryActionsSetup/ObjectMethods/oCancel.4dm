If (False:C215)
	//object Name: Object Name:      DiaryActionsSetup.oCancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SD2_l_SaveSettings)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DiaryActionsSetup.oCancel"; Form event code:C388)
CANCEL:C270
SD2_l_SaveSettings:=1
ERR_MethodTrackerReturn("OBJ DiaryActionsSetup.oCancel"; $_t_oldMethodName)
