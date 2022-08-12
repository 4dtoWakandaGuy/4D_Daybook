If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oActionNamesDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 13:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; DOC_t_ActionName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oActionNamesDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (SD_at_DiaryActionNames>0) & (SD_bo_AddingDiaryRecord) & (Old:C35([DIARY:12]Action_Code:9)="")
			[DIARY:12]Action_Code:9:=SD_at_ActionCodes{SD_at_DiaryActionNames}
			DOC_t_ActionName:=SD_at_DiaryActionNames{SD_at_DiaryActionNames}
			Diary_InD
			
			SD_at_DiaryActionNames:=0
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oActionNamesDropDown"; $_t_oldMethodName)
