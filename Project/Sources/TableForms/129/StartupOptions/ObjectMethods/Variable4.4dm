If (False:C215)
	//object Name: [WEBSETUP_4D]StartupOptions.Variable4
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
	C_LONGINT:C283(GEN_cb_1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].StartupOptions.Variable4"; Form event code:C388)

If (Self:C308->#0)
	
	If (GEN_cb_1=0)
		
		//ALERT("No point in starting the Web Server unless  you connect to Oracle.")
		
		// Self->:=0
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].StartupOptions.Variable4"; $_t_oldMethodName)
