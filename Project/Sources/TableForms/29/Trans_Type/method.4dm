If (False:C215)
	//Table Form Method Name: [TRANSACTIONS]Trans_Type
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName; vAccName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTIONS].Trans_Type"; Form event code:C388)
//Trans_Type

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		If ([TRANSACTIONS:29]Account_Code:3#[ACCOUNTS:32]Account_Code:2)
			RELATE ONE:C42([TRANSACTIONS:29]Account_Code:3)
		End if 
		vAccName:=[ACCOUNTS:32]Account_Name:3
		RELATE ONE:C42([TRANSACTIONS:29]Company_Code:9)
End case 
ERR_MethodTrackerReturn("FM [TRANSACTIONS].Trans_Type"; $_t_oldMethodName)
