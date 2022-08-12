If (False:C215)
	//Table Form Method Name: [CONTRACTS_CONTACTS]Contacts Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 08:53
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

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTRACTS_CONTACTS].Contacts Sub"; Form event code:C388)

$_l_event:=Form event code:C388
ERR_MethodTrackerReturn("FM [CONTRACTS_CONTACTS].Contacts Sub"; $_t_oldMethodName)