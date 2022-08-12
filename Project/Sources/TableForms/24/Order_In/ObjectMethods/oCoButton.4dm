If (False:C215)
	//object Name: [ORDERS]Orders_In.oCoButton
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
	C_LONGINT:C283($_l_ProcessState; ORD_SubProcCO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oCoButton"; Form event code:C388)

If ([ORDERS:24]Company_Code:1#"")
	If (ORD_SubProcCO=0)
		
		ORD_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [ORDERS:24]Company_Code:1)
		
		
	Else 
		$_l_ProcessState:=Process state:C330(ORD_SubProcCO)
		If ($_l_ProcessState<0)
			ORD_SubProcCO:=New process:C317("DBI_DisplayRecord"; 64000; "View Company"; Current process:C322; Table:C252(->[COMPANIES:2]); ""; [ORDERS:24]Company_Code:1)
			
			//ZCompanies_Mod ([ORDERS]Company Code;"True";->ORD_SubProcCO)
		Else 
			BRING TO FRONT:C326(ORD_SubProcCO)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_In.oCoButton"; $_t_oldMethodName)
