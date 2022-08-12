If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_AC.Variable17
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
	C_REAL:C285(vTot; vTot0; vTot31; vTot61; vTot91)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_AC.Variable17"; Form event code:C388)
vTot:=Round:C94((vTot0+vTot31+vTot61+vTot91); 2)
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_AC.Variable17"; $_t_oldMethodName)