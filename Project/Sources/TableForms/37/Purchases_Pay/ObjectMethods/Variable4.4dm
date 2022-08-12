If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_Pay.Variable4
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_Pay.Variable4"; Form event code:C388)
Purch_PaySel
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_Pay.Variable4"; $_t_oldMethodName)
