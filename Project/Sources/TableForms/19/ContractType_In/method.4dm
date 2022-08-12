If (False:C215)
	//Table Form Method Name: [CONTRACT_TYPES]ContractType_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/06/2011 14:34
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

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTRACT_TYPES].ContractType_In"; Form event code:C388)
$_l_event:=Form event code:C388
CTypes_InLP
ERR_MethodTrackerReturn("FM:ContractType_In"; $_t_oldMethodName)
