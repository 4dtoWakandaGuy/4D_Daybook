If (False:C215)
	//object Name: [USER]User_In.oWriteLogOnServerCheckbox
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
	C_LONGINT:C283(DB_l_GenerateLogOnServer)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oWriteLogOnServerCheckbox"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If ((Current user:C182#"Designer") & (DB_l_GenerateLogOnServer=1))  //Some body else tried ti turn it
			DB_l_GenerateLogOnServer:=0
			//     ALERT("Please note : Only Developers can turn this option ON. All other "+"
			Gen_Alert("Please note : Only Developers can turn this option ON. All other "+"users may be allowed to turn it OFF. "+"All actions are logged.")
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oWriteLogOnServerCheckbox"; $_t_oldMethodName)
