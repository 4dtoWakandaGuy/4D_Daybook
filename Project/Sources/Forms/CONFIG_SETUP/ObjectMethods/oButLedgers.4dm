If (False:C215)
	//object Name: Object Name:      CONFIG_SETUP.oButLedgers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/08/2012 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_SetupSection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oButLedgers"; Form event code:C388)

//Remember to save whatever we are looking at first

//CRM-Left hand options are..General Ledger
//                            Purchase Ledger
//                         Sales Ledger
//


DB_l_SetupSection:=5
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oButLedgers"; $_t_oldMethodName)