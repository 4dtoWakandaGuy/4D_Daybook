//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_AP
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
$_t_oldMethodName:=ERR_MethodTracker("Purchases_AP")

DBI_MenuDisplayRecords("PurchasesAutopay")
ERR_MethodTrackerReturn("Purchases_AP"; $_t_oldMethodName)