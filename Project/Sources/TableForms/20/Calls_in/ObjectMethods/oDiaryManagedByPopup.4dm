If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oDiaryManagedByPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	C_TEXT:C284($_t_oldMethodName; SD_at_TimeFrame)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oDiaryManagedByPopup"; Form event code:C388)
If (SD3_at_TimeFrame>0)
	SD_at_TimeFrame:=SD3_at_TimeFrame{SD3_at_TimeFrame}
	SD_Updatereminder
	
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oDiaryManagedByPopup"; $_t_oldMethodName)
