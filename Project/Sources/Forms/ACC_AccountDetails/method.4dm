If (False:C215)
	//Project Form Method Name:      ACC_AccountDetails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/ACC_AccountDetails/{formMethod}"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		
		
		Accounts_InLPB
		If (False:C215)
		End if 
End case 
ERR_MethodTrackerReturn("FM ACC_AccountDetails"; $_t_oldMethodName)
