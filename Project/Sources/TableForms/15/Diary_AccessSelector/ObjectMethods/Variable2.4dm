If (False:C215)
	//object Name: [USER]Diary_AccessSelector.Variable2
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
	C_LONGINT:C283(WS_l_UPDATEOWNERS)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Diary_AccessSelector.Variable2"; Form event code:C388)
WS_l_UpdateOwners:=1
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].Diary_AccessSelector.Variable2"; $_t_oldMethodName)