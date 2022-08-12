If (False:C215)
	//object Name: [PERSONNEL]Diary_View.oDiaryActionDesc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; SD_l_DescriptionSplitter)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oDiaryActionDesc"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Getting Focus:K2:7)
		SD_SetSplitter(->SD_l_DescriptionSplitter; 1)
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oDiaryActionDesc"; $_t_oldMethodName)
