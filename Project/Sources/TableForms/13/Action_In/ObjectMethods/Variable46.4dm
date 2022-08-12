If (False:C215)
	//object Name: [ACTIONS]Action_In.Variable46
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
	//ARRAY TEXT(SD2_at_DayNames;0)
	//ARRAY TEXT(SD2_at_DayNames2;0)
	C_LONGINT:C283($_l_event; SD_l_DayEnd)
	C_TEXT:C284($_t_oldMethodName; SD2_T_DayEnd)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable46"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_at_DayNames>0)
			SD_l_DayEnd:=SD2_at_DayNames2
			SD2_T_DayEnd:=SD2_at_DayNames2{SD2_at_DayNames2}
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable46"; $_t_oldMethodName)
