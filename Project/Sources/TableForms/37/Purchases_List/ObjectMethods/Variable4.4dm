If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_List.Variable4
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
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_List.Variable4"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vTotal:=Subtotal:C97([PURCHASE_INVOICES:37]Total_Invoiced:7)
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_List.Variable4"; $_t_oldMethodName)
