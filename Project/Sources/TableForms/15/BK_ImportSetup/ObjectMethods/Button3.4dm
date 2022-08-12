If (False:C215)
	//object Name: [USER]BK_ImportSetup.Button3
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
	C_LONGINT:C283($_l_OptionID; DM_l_BKOptions; DM_l_ConnectionContext)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Button3"; Form event code:C388)
If (DM_l_BKOptions>0)
	//get the model destination
	$_l_OptionID:=BK_EditDataOptions(DM_l_BKOptions; DM_l_ConnectionContext)
	
Else 
	Gen_Alert("You must select Data options to edit")
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Button3"; $_t_oldMethodName)
