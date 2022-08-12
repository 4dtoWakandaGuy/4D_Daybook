If (False:C215)
	//object Name: [USER]User_In.oAutoLoginExpiryopton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2009 14:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; PW_l_WindowsAutoLogin)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oAutoLoginExpiryopton"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PW_l_WindowsAutoLogin=1)
			Gen_Alert("Sorry you may not use this option with Automated login")
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oAutoLoginExpiryopton"; $_t_oldMethodName)
