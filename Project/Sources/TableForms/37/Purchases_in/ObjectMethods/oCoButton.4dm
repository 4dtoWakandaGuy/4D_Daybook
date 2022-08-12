If (False:C215)
	//object Name: [PURCHASE_INVOICES]Purchases_in.oCoButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2010 23:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; PI_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].Purchases_in.oCoButton"; Form event code:C388)

If ([PURCHASE_INVOICES:37]Company_Code:2#"")
	If (PI_SubProcCO=0)
		PI_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [PURCHASE_INVOICES:37]Company_Code:2)
		
		//ZCompanies_Mod ([PURCHASES]Company Code;"True";->PI_SubProcCO)
	Else 
		$_l_ProcessState:=Process state:C330(PI_SubProcCO)
		If ($_l_ProcessState<0)
			PI_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [PURCHASE_INVOICES:37]Company_Code:2)
			
			//ZCompanies_Mod ([PURCHASES]Company Code;"True";->PI_SubProcCO)
		Else 
			BRING TO FRONT:C326(PI_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].Purchases_in.oCoButton"; $_t_oldMethodName)
