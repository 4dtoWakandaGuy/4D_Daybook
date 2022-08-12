If (False:C215)
	//object Name: [USER]BK_ServerSetup.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_event; DM_l_BKServerPort)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKServerIP)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ServerSetup.Variable1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		DM_Bo_BKedit:=True:C214
		If (DM_t_BKServerIP#"")
			If (DM_l_BKServerPort=0)
				DM_l_BKServerPort:=80
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_ServerSetup.Variable1"; $_t_oldMethodName)
