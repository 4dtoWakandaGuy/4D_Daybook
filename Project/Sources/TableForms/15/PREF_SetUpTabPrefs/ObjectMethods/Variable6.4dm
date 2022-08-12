If (False:C215)
	//object Name: [USER]PREF_SetUpTabPrefs.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(Pref_l_Save)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PREF_SetUpTabPrefs.Variable6"; Form event code:C388)
Pref_l_Save:=1
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].PREF_SetUpTabPrefs.Variable6"; $_t_oldMethodName)