//%attributes = {}
If (False:C215)
	//Project Method Name:      Groups_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; vBAccount; vPAccount; vSAccount)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Groups_InLPB")
RELATE ONE:C42([PRODUCT_GROUPS:10]Sales_Account:4)
vSAccount:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([PRODUCT_GROUPS:10]Purchase_Account:5)
vPAccount:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([PRODUCT_GROUPS:10]Stock_Account:8)
vBAccount:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([PRODUCT_GROUPS:10]Analysis_Code:6)
vAnalysis:=[ANALYSES:36]Analysis_Name:2
ERR_MethodTrackerReturn("Groups_InLPB"; $_t_oldMethodName)