If (False:C215)
	//object Name: [USER]BK_ImportSetup.Variable3
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
	C_LONGINT:C283($_l_ServerID; DM_l_BKServerID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Variable3"; Form event code:C388)
If (DM_l_BKServerID>0)
	$_l_ServerID:=BK_EditServer(DM_l_BKServerID)
Else 
	Gen_Alert("You must select a server first")
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Variable3"; $_t_oldMethodName)
