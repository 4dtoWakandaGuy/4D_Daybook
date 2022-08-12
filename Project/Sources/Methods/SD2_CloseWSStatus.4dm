//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_CloseWSStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/01/2010 10:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD2_ab_EditedSettings; SD2_bo_SaveOnExit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_CloseWSStatus")
If (SD2_ab_EditedSettings)
	Gen_Confirm("Save Changes")
	If (OK=1)
		SD2_bo_SaveOnExit:=True:C214
	Else 
		SD2_bo_SaveOnExit:=False:C215
	End if 
	CANCEL:C270
Else 
	SD2_bo_SaveOnExit:=False:C215
	CANCEL:C270
	
End if 
ERR_MethodTrackerReturn("SD2_CloseWSStatus"; $_t_oldMethodName)