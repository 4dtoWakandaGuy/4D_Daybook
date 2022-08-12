//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZPurchases_AP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2010 14:45
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

$_t_oldMethodName:=ERR_MethodTracker("ZPurchases_AP")
DBI_MenuDisplayRecords("PurchasesAutopay")
ERR_MethodTrackerReturn("ZPurchases_AP"; $_t_oldMethodName)