If (False:C215)
	//object Name: [DIARY]SD2_Input.oTimeDurationP4
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
	C_LONGINT:C283($_l_event; SD2_l_DiaryDuration)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Input.oTimeDurationP4"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (SD2_l_DiaryDuration>0)
			//SD2_SetDiaryTimeFromDuration (SD2_at_DurationNames;->SD2_l_DiaryDuration)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Input.oTimeDurationP4"; $_t_oldMethodName)
