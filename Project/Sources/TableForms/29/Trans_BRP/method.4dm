If (False:C215)
	//Table Form Method Name: [TRANSACTIONS]Trans_BRP
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
	C_TEXT:C284($_t_oldMethodName; vAccName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTIONS].Trans_BRP"; Form event code:C388)
If ([TRANSACTIONS:29]Account_Code:3#[ACCOUNTS:32]Account_Code:2)
	RELATE ONE:C42([TRANSACTIONS:29]Account_Code:3)
End if 
vAccName:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([TRANSACTIONS:29]Company_Code:9)
ERR_MethodTrackerReturn("FM [TRANSACTIONS].Trans_BRP"; $_t_oldMethodName)