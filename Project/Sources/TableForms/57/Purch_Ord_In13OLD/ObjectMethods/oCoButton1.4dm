If (False:C215)
	//object Name: [PURCHASE_ORDERS]Purch_Ord_In13OLD.oCoButton1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2010 22:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; PO_SubProcCO2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oCoButton1"; Form event code:C388)

If ([PURCHASE_ORDERS:57]Deliver_to_Company:6#"")
	If (PO_SubProcCO2=0)
		//DBI_MenuDisplayRecords ("Companies";Module_PurchaseOrders ;"";->PO_SubProcCO2;->[PURCHASE ORDERS]Del to Comp)
		PO_SubProcCO2:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [PURCHASE_ORDERS:57]Deliver_to_Company:6)
		//ZCompanies_Mod ([PURCHASE ORDERS]Del to Comp;"True";->PO_SubProcCO2)
	Else 
		$_l_ProcessState:=Process state:C330(PO_SubProcCO2)
		If ($_l_ProcessState<0)
			//DBI_MenuDisplayRecords ("Companies";Module_PurchaseOrders ;"";->PO_SubProcCO2;->[PURCHASE ORDERS]Del to Comp)
			PO_SubProcCO2:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [PURCHASE_ORDERS:57]Deliver_to_Company:6)
			
			//ZCompanies_Mod ([PURCHASE ORDERS]Del to Comp;"True";->PO_SubProcCO2)
		Else 
			BRING TO FRONT:C326(PO_SubProcCO2)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oCoButton1"; $_t_oldMethodName)
