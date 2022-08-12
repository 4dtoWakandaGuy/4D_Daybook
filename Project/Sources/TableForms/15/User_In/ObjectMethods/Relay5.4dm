If (False:C215)
	//object Name: [USER]User_In.Relay5
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Relay5"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		OPEN URL:C673("http://www.smsrelay.com")
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Relay5"; $_t_oldMethodName)
