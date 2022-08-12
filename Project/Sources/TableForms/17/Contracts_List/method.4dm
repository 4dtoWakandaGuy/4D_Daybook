If (False:C215)
	//Table Form Method Name: [CONTRACTS]Contracts_List
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTRACTS].Contracts_List"; Form event code:C388)
RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
Contact_Details
RELATE MANY:C262([CONTRACTS:17]Contract_Code:3)
ERR_MethodTrackerReturn("FM [CONTRACTS].Contracts_List"; $_t_oldMethodName)