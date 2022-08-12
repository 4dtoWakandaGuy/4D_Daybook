If (False:C215)
	//object Name: [DIARY]SD2_Input.oTimeDurationPopUpP1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_DurationNames;0)
	C_LONGINT:C283($_l_event; SD2_l_DiaryDuration)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Input.oTimeDurationPopUpP1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD2_SetDiaryTimeFromDuration(SD2_at_DurationNames; ->SD2_l_DiaryDuration)
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Input.oTimeDurationPopUpP1"; $_t_oldMethodName)
