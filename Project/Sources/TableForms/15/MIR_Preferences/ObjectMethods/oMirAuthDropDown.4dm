If (False:C215)
	//object Name: [USER]MIR_Preferences.oMirAuthDropDown
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
	//Array TEXT(MIR_at_Authentication;0)
	C_TEXT:C284(<>MIR_t_AuthenticationPassword; <>MIR_t_AuthenticationRequired; <>MIR_t_AuthenticationUserName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMirAuthDropDown"; Form event code:C388)


<>MIR_t_AuthenticationRequired:=MiR_at_Authentication{MiR_at_Authentication}
If (MIR_at_Authentication=2)
	OBJECT SET ENTERABLE:C238(<>MIR_t_AuthenticationUserName; True:C214)
	OBJECT SET ENTERABLE:C238(<>MIR_t_AuthenticationPassword; True:C214)
Else 
	OBJECT SET ENTERABLE:C238(<>MIR_t_AuthenticationUserName; False:C215)
	OBJECT SET ENTERABLE:C238(<>MIR_t_AuthenticationPassword; False:C215)
End if 
//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMirAuthDropDown"; $_t_oldMethodName)