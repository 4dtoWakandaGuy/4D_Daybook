//%attributes = {}
If (False:C215)
	//Project Method Name:      Transactions_Sort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 16:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Transactions_Sort")
Case of 
	: (vTitle="TRANSACTIONS BY DATE")
		//TRACE
		ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5; >)
		ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5; >; [TRANSACTIONS:29]Batch_Number:7; >)
	: (vTitle="TRANSACTIONS BY TYPE")
		ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1; >; [TRANSACTIONS:29]Batch_Number:7; >)
	: (vTitle="TRANSACTIONS BY ACCOUNT")
		ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3; >; [TRANSACTIONS:29]Batch_Number:7; >)
	: (vTitle="VAT Listing")
		ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18; >; [TRANSACTIONS:29]UK_EC:21; >; [TRANSACTIONS:29]Batch_Number:7; >)
End case 
ERR_MethodTrackerReturn("Transactions_Sort"; $_t_oldMethodName)