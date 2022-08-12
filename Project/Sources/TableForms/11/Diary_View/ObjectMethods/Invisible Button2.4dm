If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Invisible Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_AppointmentRecordIDs;0)
	//ARRAY TEXT(SD_at_Query;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Invisible Button2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (SD_at_Query<Size of array:C274(SD_at_Query))
			SD_at_Query:=SD_at_Query+1
		Else 
			SD_at_Query:=1
		End if 
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		SD_SetFieldsFalse
		SD_EventItemData(SD_al_AppointmentRecordIDs{SD_at_Query})
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Invisible Button2"; $_t_oldMethodName)
