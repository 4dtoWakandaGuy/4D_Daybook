If (False:C215)
	//object Name: [DIARY]ContactNote.oActionPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2012 16:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SD2_NoteAction)
	//ARRAY TEXT(SD2_at_DactionNames;0)
	//ARRAY TEXT(SD2_at_DiaryActionCodes;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].ContactNote.oActionPopup"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (Self:C308->>0)
			[DIARY:12]Action_Code:9:=SD2_at_DiaryActionCodes{SD2_at_DiaryActionCodes}
			SD2_NoteAction:=SD2_at_DactionNames{SD2_at_DiaryActionCodes}
			
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].ContactNote.oActionPopup"; $_t_oldMethodName)
