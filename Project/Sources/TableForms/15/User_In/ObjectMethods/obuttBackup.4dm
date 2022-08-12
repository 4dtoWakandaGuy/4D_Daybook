If (False:C215)
	//object Name: [USER]User_In.obuttBackup
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
	C_TEXT:C284($_t_oldMethodName; $_t_Parameter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.obuttBackup"; Form event code:C388)
If (Application type:C494#4D Remote mode:K5:5)
	
	$_t_Parameter:="/Backup/Configuration"
	OPEN SETTINGS WINDOW:C903($_t_Parameter)
	
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.obuttBackup"; $_t_oldMethodName)
