If (False:C215)
	//object Name: [WEBSETUP_4D]StartupOptions.Variable1
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
	//Array TEXT(GEN_at_Servers;0)
	C_LONGINT:C283(GEN_cb_2)
	C_TEXT:C284(<>SQL_s_CentralServerName; $_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].StartupOptions.Variable1"; Form event code:C388)

If (Self:C308->>0)
	
	GEN_at_Servers:=Find in array:C230(GEN_at_Servers; <>SQL_s_CentralServerName)
	
Else 
	
	GEN_at_Servers:=0
	
	// If (GEN_cb_2>0)       ` Axel took message out
	//  _DLG_CONFIRM ("Do you want to start the Web Server without Oracle?";False;"No"
	// If (OK=1)
	GEN_cb_2:=0
	//   End if
	// End if
	
End if 
//end
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].StartupOptions.Variable1"; $_t_oldMethodName)