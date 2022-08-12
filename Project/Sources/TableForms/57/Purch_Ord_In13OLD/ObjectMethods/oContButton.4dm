If (False:C215)
	//object Name: [PURCHASE_ORDERS]Purch_Ord_In13OLD.oContButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 20:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; PO_SubProcCON)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oContButton"; Form event code:C388)

If ([PURCHASE_ORDERS:57]Contact_Code:5#"")
	If (PO_SubProcCON=0)
		
		ZContacts_Mod([PURCHASE_ORDERS:57]Contact_Code:5; "True"; ->PO_SubProcCON)
	Else 
		$_l_ProcessState:=Process state:C330(PO_SubProcCON)
		If ($_l_ProcessState<0)
			ZContacts_Mod([PURCHASE_ORDERS:57]Contact_Code:5; "True"; ->PO_SubProcCON)
		Else 
			BRING TO FRONT:C326(PO_SubProcCON)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oContButton"; $_t_oldMethodName)
