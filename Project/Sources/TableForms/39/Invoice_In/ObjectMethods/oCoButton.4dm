If (False:C215)
	//object Name: [INVOICES]Invoices_In.oCoButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/08/2011 13:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; INV_SubProcCO; PO_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.oCoButton"; Form event code:C388)

If ([INVOICES:39]Company_Code:2#"")
	If (INV_SubProcCO=0)
		INV_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [INVOICES:39]Company_Code:2)
		
	Else 
		$_l_ProcessState:=Process state:C330(PO_SubProcCO)
		If ($_l_ProcessState<0)
			//DBI_MenuDisplayRecords ("Companies";Module_PurchaseOrders ;"";->PO_SubProcCO;->[PURCHASE ORDERS]Company Code)
			INV_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [INVOICES:39]Company_Code:2)
			
			//ZCompanies_Mod ([PURCHASE ORDERS]Company Code;"True";->PO_SubProcCO)
		Else 
			BRING TO FRONT:C326(INV_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_In.oCoButton"; $_t_oldMethodName)
