If (False:C215)
	//object Name: [USER]User_In.oDiaryActionsDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 13:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	C_TEXT:C284($_t_oldMethodName; SP_t_DiaryActionCode; SP_t_DiaryActionName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oDiaryActionsDropDown"; Form event code:C388)
If (SD_at_DiaryActionNames>0)
	SP_t_DiaryActionName:=SD_at_DiaryActionNames{SD_at_DiaryActionNames}
	SP_t_DiaryActionCode:=SD_at_ActionCodes{SD_at_DiaryActionNames}
	SD_at_DiaryActionNames{0}:=SD_at_DiaryActionNames{SD_at_DiaryActionNames}
	SD_at_DiaryActionNames:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oDiaryActionsDropDown"; $_t_oldMethodName)
