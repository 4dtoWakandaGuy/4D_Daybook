If (False:C215)
	//Table Form Method Name: [DIARY]Diary_AlarmManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 13:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_ActionCodeRow; $_l_event; SD_l_alarmPostpone)
	C_TEXT:C284($_t_oldMethodName; DOC_t_ActionName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_AlarmManager"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_AlarmManager")
		SD_l_alarmPostpone:=0
		$_l_ActionCodeRow:=Find in array:C230(SD_at_ActionCodes; [DIARY:12]Action_Code:9)
		If ($_l_ActionCodeRow>0)
			
			DOC_t_ActionName:=SD_at_DiaryActionNames{$_l_ActionCodeRow}
		Else 
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
			DOC_t_ActionName:=[ACTIONS:13]Action_Name:2
		End if 
		WS_AutoscreenSize(3; 232; 390)
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [DIARY].Diary_AlarmManager"; $_t_oldMethodName)
