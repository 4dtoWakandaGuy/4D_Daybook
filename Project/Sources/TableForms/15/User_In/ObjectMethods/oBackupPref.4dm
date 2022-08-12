If (False:C215)
	//object Name: [USER]User_In.oBackupPref
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
	//ARRAY TEXT(BP_at_NumOfFile;0)
	C_LONGINT:C283(BP_l_NumOfFile; BP_l_onlydoafterpecifiedTime)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oBackupPref"; Form event code:C388)

If (BP_l_onlydoafterpecifiedTime=1)
	BP_at_NumOfFile:=11
	BP_l_NumOfFile:=999
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oBackupPref"; $_t_oldMethodName)
