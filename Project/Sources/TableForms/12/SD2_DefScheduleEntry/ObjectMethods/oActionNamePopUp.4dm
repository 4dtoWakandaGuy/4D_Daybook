If (False:C215)
	//object Name: [DIARY]SD2_DefScheduleEntry.oActionNamePopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_DactionNames;0)
	//ARRAY TEXT(SD2_at_DiaryActionCodes;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; SD2_t_SELActionName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_DefScheduleEntry.oActionNamePopUp"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_at_DactionNames>0)
			SD2_t_SELActionName:=SD2_at_DactionNames{SD2_at_DactionNames}
			[DIARY:12]Action_Code:9:=SD2_at_DiaryActionCodes{SD2_at_DactionNames}
			SD2_ChangeActionCode("SD2_DefScheduleEntry")
			SD2_ControlResultsInterface
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_DefScheduleEntry.oActionNamePopUp"; $_t_oldMethodName)
