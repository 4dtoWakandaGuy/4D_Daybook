If (False:C215)
	//object Name: [INVOICES]Invoices_Pay.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; INV_t_ButtonText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_Pay.Variable5"; Form event code:C388)
Case of 
	: (INV_t_ButtonText="Receipt")
		//TRACE
		Invoices_PaySel
	: (INV_t_ButtonText="Refund")
		INV_RefundSel
	: (INV_t_ButtonText="Reverse Receipt")
		INV_UndoSel
End case 
ERR_MethodTrackerReturn("OBJ:Invoices_Pay,xSelect"; $_t_oldMethodName)
