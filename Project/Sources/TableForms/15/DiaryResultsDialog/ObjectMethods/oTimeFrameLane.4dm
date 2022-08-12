If (False:C215)
	//object Name: [USER]DiaryResultsDialog.Pop-up%2FDrop-down List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DiaryResultsDialog.Pop-up/Drop-down List2"; Form event code:C388)
If (SD3_at_TimeFrame>0)
	SD_at_TimeFrame:=SD3_at_TimeFrame{SD3_at_TimeFrame}
	SD_Updatereminder
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].DiaryResultsDialog.Pop-up/Drop-down List2"; $_t_oldMethodName)
