If (False:C215)
	//object Name: [WEBSETUP_4D]StartupOptions.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2013 01:02
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].StartupOptions.Button1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].StartupOptions.Button1"; $_t_oldMethodName)