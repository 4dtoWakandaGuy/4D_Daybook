//%attributes = {}
If (False:C215)
	//Project Method Name:      GRP_GetStockAccount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 13:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GRP_GetStockAccount")
If ([PRODUCT_GROUPS:10]Stock_Account:8#"")
	If ([ACCOUNTS:32]Account_Code:2#[PRODUCT_GROUPS:10]Stock_Account:8)
		QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=[PRODUCT_GROUPS:10]Stock_Account:8)
		$0:=[ACCOUNTS:32]Account_Name:3
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("GRP_GetStockAccount"; $_t_oldMethodName)