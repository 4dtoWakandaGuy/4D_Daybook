If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oDeleteRule
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
	C_LONGINT:C283(SD_l_UseAgenda)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable38"; Form event code:C388)
If (SD_l_UseAgenda>0)
	If ([PERSONNEL:11]Personnel_ID:48=0)
		[PERSONNEL:11]Personnel_ID:48:=AA_GetNextID(->[PERSONNEL:11]Personnel_ID:48)
	End if 
	SD_SetColourPreferences([PERSONNEL:11]Personnel_ID:48; False:C215)
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Variable38"; $_t_oldMethodName)
