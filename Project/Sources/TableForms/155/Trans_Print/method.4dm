If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCH_ITEMS]Trans_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vCAccName; vDAccName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCH_ITEMS].Trans_Print"; Form event code:C388)

RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
vDAccName:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
vCAccName:=[ACCOUNTS:32]Account_Name:3
ERR_MethodTrackerReturn("FM [TRANSACTION_BATCH_ITEMS].Trans_Print"; $_t_oldMethodName)