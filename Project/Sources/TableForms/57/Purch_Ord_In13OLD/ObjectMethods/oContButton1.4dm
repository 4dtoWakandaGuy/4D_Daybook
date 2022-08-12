If (False:C215)
	//object Name: [PURCHASE_ORDERS]Purch_Ord_In13OLD.oContButton1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2010 23:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; PO_SubProcCON2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oContButton1"; Form event code:C388)

If ([PURCHASE_ORDERS:57]Deliver_to_Contact:7#"")
	If (PO_SubProcCON2=0)
		PO_SubProcCON2:=New process:C317("DBI_DisplayRecord"; 64000; "View Contact"; Current process:C322; Table:C252(->[CONTACTS:1]); ""; [PURCHASE_ORDERS:57]Deliver_to_Contact:7)
		
		
		//ZContacts_Mod ([PURCHASE ORDERS]Del to Cont;"True";->PO_SubProcCON2)
	Else 
		$_l_ProcessState:=Process state:C330(PO_SubProcCON2)
		If ($_l_ProcessState<0)
			PO_SubProcCON2:=New process:C317("DBI_DisplayRecord"; 64000; "View Contact"; Current process:C322; Table:C252(->[CONTACTS:1]); ""; [PURCHASE_ORDERS:57]Deliver_to_Contact:7)
			
			
			
		Else 
			BRING TO FRONT:C326(PO_SubProcCON2)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oContButton1"; $_t_oldMethodName)
