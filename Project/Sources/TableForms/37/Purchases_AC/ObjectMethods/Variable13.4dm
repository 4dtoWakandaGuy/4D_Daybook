If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_AC.Variable13
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
	C_REAL:C285(v0; vTot0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_AC.Variable13"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vTot0:=Round:C94(Subtotal:C97(v0); 2)
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_AC.Variable13"; $_t_oldMethodName)
