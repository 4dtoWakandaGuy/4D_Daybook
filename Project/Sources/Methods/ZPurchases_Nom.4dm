//%attributes = {}
If (False:C215)
	//Project Method Name:      ZPurchases_Nom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2010 12:26
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

$_t_oldMethodName:=ERR_MethodTracker("ZPurchases_Nom")
DBI_MenuDisplayRecords("PurchasesPost")
ERR_MethodTrackerReturn("ZPurchases_Nom"; $_t_oldMethodName)