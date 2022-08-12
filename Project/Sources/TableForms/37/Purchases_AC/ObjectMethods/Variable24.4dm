If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_AC.Variable24
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
	C_REAL:C285(vTot; vTot31; vTotP31)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_AC.Variable24"; Form event code:C388)
vTotP31:=Round:C94((vTot31/vTot*100); 2)
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_AC.Variable24"; $_t_oldMethodName)