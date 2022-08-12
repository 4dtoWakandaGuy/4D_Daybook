If (False:C215)
	//object Name: [ACTIONS]Action_In.Variable45
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
	C_LONGINT:C283($_l_event; SD_l_DayStart)
	C_TEXT:C284($_t_oldMethodName; SD2_t_DayStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable45"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_at_DayNames>0)
			SD_l_DayStart:=SD2_at_DayNames
			SD2_t_DayStart:=SD2_at_DayNames{SD2_at_DayNames}
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable45"; $_t_oldMethodName)
