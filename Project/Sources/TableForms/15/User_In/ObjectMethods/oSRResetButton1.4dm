If (False:C215)
	//object Name: [USER]User_In.SR_btnResetOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.SR_btnResetOptions"; Form event code:C388)

//Added 13/11/08 v631b120g -kmw

ReportsIn_PrefsSetDefaults
ReportsIn_PrefsSetVisibility
ERR_MethodTrackerReturn("OBJ [USER].User_In.SR_btnResetOptions"; $_t_oldMethodName)
