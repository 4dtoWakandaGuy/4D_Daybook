If (False:C215)
	//object Name: [USER]MIR_Preferences.oMIR_atServers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2009 10:07
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMIR_atServers"; Form event code:C388)

//automatically repaired method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMIR_atServers"; $_t_oldMethodName)