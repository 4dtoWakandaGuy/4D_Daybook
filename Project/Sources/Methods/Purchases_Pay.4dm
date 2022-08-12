//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_Pay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 22:03
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
$_t_oldMethodName:=ERR_MethodTracker("Purchases_Pay")

DBI_MenuDisplayRecords("PurchasesPayment")
ERR_MethodTrackerReturn("Purchases_Pay"; $_t_oldMethodName)