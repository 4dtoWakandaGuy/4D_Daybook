If (False:C215)
	//object Name: [USER]JOB_PermConfig.oLBQuals
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(JOB_bo_ConfigisModified)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].JOB_PermConfig.oLBQuals"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		JOB_bo_ConfigisModified:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].JOB_PermConfig.oLBQuals"; $_t_oldMethodName)
