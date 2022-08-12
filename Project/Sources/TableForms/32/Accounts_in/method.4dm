If (False:C215)
	//Table Form Method Name: [ACCOUNTS]Accounts_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2011 16:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNTS].Accounts_in"; Form event code:C388)
$_l_event:=Form event code:C388
//ACC_LBI_Items ($_l_event)
//Acc
Accounts_InLP($_l_event)
ERR_MethodTrackerReturn("FM:[ACCOUNTS].Accounts_in"; $_t_oldMethodName)
