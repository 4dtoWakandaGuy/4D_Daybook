If (False:C215)
	//object Name: [USER]DiaryResultsDialog.Invisible Button1
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
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DiaryResultsDialog.Invisible Button1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If ([DIARY:12]Result_Description:12#"")
			Text_Expand(->[DIARY:12]Result_Description:12; "Diary Result"; SD_bo_AddingDiaryRecord)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].DiaryResultsDialog.Invisible Button1"; $_t_oldMethodName)
