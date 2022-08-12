If (False:C215)
	//object Name: [PURCHASE_ORDERS]PurchaseOrder_In.oCoButton
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
	C_LONGINT:C283($_l_ProcessState; PO_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oCoButton"; Form event code:C388)

If ([PURCHASE_ORDERS:57]Company_Code:1#"")
	If (PO_SubProcCO=0)
		//DBI_MenuDisplayRecords ("Companies";Module_PurchaseOrders ;"";->PO_SubProcCO;->[PURCHASE ORDERS]Company Code)
		PO_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [PURCHASE_ORDERS:57]Company_Code:1)
		
		
		//ZCompanies_Mod ([PURCHASE ORDERS]Company Code;"True";->PO_SubProcCO)
	Else 
		$_l_ProcessState:=Process state:C330(PO_SubProcCO)
		If ($_l_ProcessState<0)
			//DBI_MenuDisplayRecords ("Companies";Module_PurchaseOrders ;"";->PO_SubProcCO;->[PURCHASE ORDERS]Company Code)
			PO_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [PURCHASE_ORDERS:57]Company_Code:1)
			
			//ZCompanies_Mod ([PURCHASE ORDERS]Company Code;"True";->PO_SubProcCO)
		Else 
			BRING TO FRONT:C326(PO_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.oCoButton"; $_t_oldMethodName)
